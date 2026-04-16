#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"
hyprcursors_root="${script_dir}/../hyprcursors"
hyprcursors_ws_dir="${hyprcursors_root}/working_states"
hyprcursors_dir="${hyprcursors_root}/themes"
archives_dir="${script_dir}/../archives"
themes_to_archive="Nordzy-hyprcursors Nordzy-hyprcursors-white Nordzy-hyprcursors-lefthand Nordzy-hyprcursors-white-lefthand"

# INFO: Cleanup
rm -rf "${hyprcursors_root}"
mkdir -p "${hyprcursors_ws_dir}"
mkdir -p "${hyprcursors_dir}"

# INFO:

function main() {
    # INFO: Determine themes to make
    local themes
    themes="$(find "${script_dir}/svgs/themes" -iregex ".*\.svg" -not -iregex ".*spinner\.svg" -exec basename {} .svg \;)"

    mapfile -t themes_arr < <(echo "${themes}")

    local progress=0
    local total=${#themes_arr[@]}
    local total_estimate=0
    local estimation_count=0
    for theme_name in ${themes}; do
        start_time=$SECONDS
        progress=$((progress + 1))
        if [ ${estimation_count} -gt 0 ]; then
            mean_estimate="$(perl -E "say (${total_estimate} / ${estimation_count})")"
        else
            mean_estimate="0"
        fi
        echo "[${progress}/${total}] Making theme ${theme_name}... (estimated time: $(echo "$(perl -E "say ${mean_estimate} * (${total} - ${progress})") / 60" | bc) minutes)"
        make_theme "${theme_name}"
        total_estimate=$((total_estimate + (SECONDS - start_time)))
        estimation_count=$((estimation_count + 1))
    done

    # INFO: Export Nordzy-hyprcursors and Nordzy-hyprcursors-white to the archives folder
    for archive in ${themes_to_archive}; do
        local archive_file="${archives_dir}/${archive}.tar.gz"
        rm -rf "${archive_file}"
        tar zcvf "${archive_file}" --directory="${hyprcursors_dir}" "${archive}"
        sha256sum "${archive_file}" >>"${archives_dir}/checksums"
    done
}

function make_theme() {
    local theme_name="${1}"
    local theme_svg_filepath="${script_dir}/svgs/themes/${theme_name}.svg"
    if [ ! -f "${theme_svg_filepath}" ]; then
        echo "Could not find svgs file: ${theme_svg_filepath}"
        exit 1
    fi
    local theme_animations_svg_filepath="${script_dir}/svgs/themes/${theme_name}-spinner.svg"
    if [ ! -f "${theme_animations_svg_filepath}" ]; then
        echo "Could not find svgs file: ${theme_animations_svg_filepath}"
        exit 1
    fi

    # INFO: Prepare hyprcursor

    # Make the hyprcursor dir
    local hyprcursor_theme_dir="${hyprcursors_ws_dir}/${theme_name}"
    mkdir -p "${hyprcursor_theme_dir}"
    # Make the dir for the shapes
    local hyprcursor_shapes_dir="${hyprcursor_theme_dir}/hyprcursors"
    mkdir -p "${hyprcursor_shapes_dir}"
    # Create the manifest
    echo "cursors_directory = hyprcursors
name = ${theme_name}" >"${hyprcursor_theme_dir}/manifest.hl"
    local handiness=""
    if [[ "${theme_name}" == *"-lefthand" ]]; then
        handiness="-lefthand"
    fi

    # INFO: Prepare the theme svgs for shape extraction

    # Temporarily copy the theme svg for processing
    local tmp_theme_svg="${hyprcursor_theme_dir}/.tmp.svg"
    local tmp_animation_theme_svg="${hyprcursor_theme_dir}/.tmp_anim.svg"
    cp "${theme_svg_filepath}" "${tmp_theme_svg}"
    cp "${theme_animations_svg_filepath}" "${tmp_animation_theme_svg}"

    function cleanup_svg() {
        # remove layer concept making everything just groups
        sed -i 's|inkscape:groupmode="layer"||g' "${1}"
        # remove shadow/shadows group
        inkscape "${1}" --actions='unlock-all;select-by-selector:g[inkscape\00003Alabel="shadows"];select-by-selector:g[inkscape\00003Alabel="shadow"];delete-selection' -o "${1}"
    }
    cleanup_svg "${tmp_theme_svg}"
    cleanup_svg "${tmp_animation_theme_svg}"

    # INFO: Make all the static shapes

    mapfile -t slices < <(tr -d '\n' <"${tmp_theme_svg}" | grep -oP "<g.*?inkscape:label=\"slices\".*?</g>" | sed 's/<g[^>]*>//' | grep -Po 'id="\K.*?(?=")')

    local progress=0
    local total=${#slices[@]}
    for shape_name in "${slices[@]}"; do
        progress=$((progress + 1))
        echo "[${progress}/${total}] Making shape ${shape_name}..."
        make_shape "${shape_name}" "${tmp_theme_svg}" "${hyprcursor_shapes_dir}" "${handiness}"
    done

    # INFO: Make all the animated shapes

    local all_animation_slices
    all_animation_slices=$(tr -d '\n' <"${tmp_animation_theme_svg}" | grep -oP "<g.*?inkscape:label=\"slices\".*?</g>" | sed 's/<g[^>]*>//' | grep -Po 'id="\K.*?(?=")')
    mapfile -t animated_shapes < <(echo "${all_animation_slices}" | sed "s/-[[:digit:]]*//g" | tr ' ' '\n' | sort | uniq)

    local progress=0
    local total=${#animated_shapes[@]}
    for shape_name in "${animated_shapes[@]}"; do
        progress=$((progress + 1))
        echo "[${progress}/${total}] Making shape ${shape_name}..."
        make_animated_shape "${shape_name}" "${tmp_animation_theme_svg}" "${hyprcursor_shapes_dir}" "${all_animation_slices}" "${handiness}"
    done

    # INFO: Make the hyprcursor and export it to the themes dir
    generated_hyprcursors_path="${hyprcursors_dir}/$(echo "${theme_name}" | sed "s/-cursors//" | sed "s/^Nordzy/Nordzy-hyprcursors/")"
    hyprcursor-util -c "${hyprcursors_ws_dir}/${theme_name}" -o "${hyprcursors_dir}"
    mv "${hyprcursors_dir}/theme_${theme_name}" "${generated_hyprcursors_path}"

    # INFO: Cleanup
    rm "${tmp_theme_svg}"
    rm "${tmp_animation_theme_svg}"
}

function make_animated_shape() {
    local shape_name="${1}"
    local theme_svg_filepath="${2}"
    local hyprcursor_shapes_dir="${3}"
    local all_animation_slices="${4}"

    # INFO: Prepare hyprcursor shape
    mkdir -p "${hyprcursor_shapes_dir}/${shape_name}"

    # INFO: Export and add every slice to the shape
    rm -f "${hyprcursor_shapes_dir}/${shape_name}/meta.hl"
    for slice_name in $(echo "${all_animation_slices}" | grep "^${shape_name}" | sort); do
        echo "define_size = 0, ${slice_name}.svg, $((1000 / 16))" >>"${hyprcursor_shapes_dir}/${shape_name}/meta.hl"
        output_slice "${theme_svg_filepath}" "${hyprcursor_shapes_dir}/${shape_name}/${slice_name}.svg" "${slice_name}"
    done

    # INFO: Add everride and hotspot info
    append_info_to_shape_meta_file "${hyprcursor_shapes_dir}" "${shape_name}" "${handiness}"
}

function make_shape() {
    local shape_name="${1}"
    local theme_svg_filepath="${2}"
    local hyprcursor_shapes_dir="${3}"
    local handiness="${4}"

    # INFO: Prepare hyprcursor shape
    mkdir -p "${hyprcursor_shapes_dir}/${shape_name}"
    echo "define_size = 0, ${shape_name}.svg" >"${hyprcursor_shapes_dir}/${shape_name}/meta.hl"

    # INFO: Add everride and hotspot info
    append_info_to_shape_meta_file "${hyprcursor_shapes_dir}" "${shape_name}" "${handiness}"

    output_slice "${theme_svg_filepath}" "${hyprcursor_shapes_dir}/${shape_name}/${shape_name}.svg" "${shape_name}"
}

function output_slice() {
    local theme_svg_filepath="${1}"
    local output_svg="${2}"
    local slice_name="${3}"
    local handiness="${4}"

    # Cp svg shape
    cp "${theme_svg_filepath}" "${output_svg}"

    # pop cursor slice out of the slices group
    inkscape "${output_svg}" --actions="select-by-id:${slice_name};selection-ungroup-pop;selection-unhide" -o "${output_svg}"

    # remove slices group
    inkscape "${output_svg}" --actions='select-by-selector:g[inkscape\00003Alabel="slices"];delete-selection' -o "${output_svg}"

    # resize page to slice and remove it
    inkscape "${output_svg}" --actions="select-by-id:${slice_name};page-fit-to-selection;delete-selection" -o "${output_svg}"

    # ungroup cursor paths
    inkscape "${output_svg}" --actions='select-by-selector:g[inkscape\00003Alabel="cursors"];selection-ungroup' -o "${output_svg}"

    # use svgo to cleanup everything outside of the page
    svgo "${output_svg}" -o "${output_svg}" --config "${script_dir}/svgo.config.mjs" >/dev/null
}

function append_info_to_shape_meta_file() {
    local hyprcursor_shapes_dir="${1}"
    local shape_name="${2}"
    local handiness="${3}"

    # INFO: Resolve hotspots
    IFS=" " read -r -a hotspots_in <<<"$(head -n1 "${script_dir}/hotspots${handiness}/${shape_name}.in" | cut -d " " -f 1-3)"

    # INFO: Resolve shapes overrides
    local overrides
    overrides="$(grep "ln\s*-sf\s*${shape_name}" "${script_dir}/make.sh" | awk '{print "define_override = "$4}')"

    # INFO: Write meta.hl
    echo "hotspot_x = $(perl -E "say ${hotspots_in[1]} / ${hotspots_in[0]}")" >>"${hyprcursor_shapes_dir}/${shape_name}/meta.hl"
    echo "hotspot_y = $(perl -E "say ${hotspots_in[2]} / ${hotspots_in[0]}")" >>"${hyprcursor_shapes_dir}/${shape_name}/meta.hl"
    if [ -n "${overrides}" ]; then
        echo "${overrides}" >>"${hyprcursor_shapes_dir}/${shape_name}/meta.hl"
    fi
}

main
