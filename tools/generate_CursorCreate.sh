#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"
xcursors_dir="${script_dir}/../xcursors"
cc_dir="${script_dir}/CursorCreate"
cc_build_file="${script_dir}/CC_build.json"
cc_script="CursorCreate/cursorcreate.py" # Local to cc_dir

themes_to_archive="Nordzy-cursors Nordzy-cursors-white Nordzy-cursors-lefthand Nordzy-cursors-white-lefthand"

# Setup python env
pushd "${script_dir}" >/dev/null || exit 1
git submodule update --init -f
python -m venv CC_venv >/dev/null
source CC_venv/bin/activate >/dev/null
pip install -r "${script_dir}/CursorCreate/requirements.txt" >/dev/null
popd >/dev/null || exit 1

tmp_themes_dir="${cc_dir}/themes"

rm -rf "${tmp_themes_dir}"
mkdir -p "${tmp_themes_dir}"

themes=$(find "${xcursors_dir}" -mindepth 1 -maxdepth 1 -type d)

for theme in ${themes}; do
    theme_name=$(basename "$theme")
    echo "CursorCreating ${theme_name}"

    theme_dir="${tmp_themes_dir}/${theme_name}"
    mkdir -p "${theme_dir}"

    cp "${cc_build_file}" "${theme_dir}"
    for file in "${theme}"/cursors/*; do
        ln -sf "$file" "${theme_dir}/$(basename "$file")"
    done

    pushd "${cc_dir}" >/dev/null || exit 1
    # Build the cursors
    python "${cc_script}" --build "${theme_dir}/$(basename "${cc_build_file}")"
    popd >/dev/null || exit 1

    # Cp the windows cursors
    windows_zip="${theme_dir}/windows/${theme_name}.zip"
    unzip -o "${windows_zip}" -d "${script_dir}/../Windows_cursors" >/dev/null

    # Cp the macos cursors
    macos_file="${theme_dir}/mousecape_macos/${theme_name}.cape"
    cp "${macos_file}" "${script_dir}/../MacOs_cursors"

    if echo "${themes_to_archive}" | grep -w -q "$theme_name"; then
        echo "Archiving ${theme_name}"

        archives_dir="${script_dir}/../archives"

        cp "${windows_zip}" "${archives_dir}/${theme_name}_windows.zip"
        zip "${archives_dir}/${theme_name}_macos.zip" "${macos_file}"
    fi
done
rm -rf "${tmp_themes_dir}"

# Deactivate python env (I don't think I need to but eh)
deactivate
