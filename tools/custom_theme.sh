#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"

# Display ascii art
ascii_art() {
    cat <"${script_dir}/../resources/nordzy-ascii-art.txt"
    sleep 0.5
}

# Show help
usage() {
    cat <<EOF
$0 helps you create Nordzy-cursor custom theme on your computer.

Usage: $0 [OPTION]...

OPTIONS:
	-a, --accent COLOR 			Change accent color (default: Nord_turquoise) to the specified color in hexadecimal format.
  -b, --border COLOR      Change border color (default: white) to the specified color in hexadecimal format.
  -f, --fill COLOR        Change fill color (default: black) to the specified color in hexadecimal format.
  -g, --green COLOR 			Change green color (default: green) to the specified color in hexadecimal format.
  -h, --help              Show help.
  -n, --name NAME         Specify theme name (Default: default_name).
  -o, --orange COLOR 			Change orange color (default: orange) to the specified color in hexadecimal format.
  -p, --purple COLOR 			Change purple color (default: purple) to the specified color in hexadecimal format.
  -r, --red COLOR 				Change red color (default: red) to the specified color in hexadecimal format.
  -A, --archive 				Export this cursor as an archive.

EOF
}

# Display an animation during long working time (ex. Creation of the theme)
animation() {
    frames=("." ".." "...")
    while kill -0 "${1}" >/dev/null 2>&1; do
        for frame in "${frames[@]}"; do
            printf "Rendering PNGs for %s %s  \r" "${2}" "${frame}"
            sleep 0.5
        done
    done
    printf "PNGs for %s finished \n" "${2}"
}

png_render() {
    local script_dir="${1}"
    local theme_name="${2}"
    python "${script_dir}/render-pngs.py" "svgs/themes/${theme_name:-default_name}.svg"
    python "${script_dir}/render-pngs.py" "svgs/themes/${theme_name:-default_name}-spinner.svg"
}

generate_colored_svg() {
    # Copy of the template files
    local theme_filename="${script_dir}/svgs/themes/${theme_name:-default_name}.svg"
    local spinner_theme_filename="${script_dir}/svgs/themes/${theme_name:-default_name}-spinner.svg"

    cp "${svg_template_main}" "${theme_filename}"
    cp "${svg_template_spinner}" "${spinner_theme_filename}"

    # Change the fill color (black/#000000)
    sed -i "s/#000000/${theme_color_fill:-#000000}/g" "${theme_filename}"
    sed -i "s/#000000/${theme_color_fill:-#000000}/g" "${spinner_theme_filename}"

    # Change the border color (white/#ffffff)
    sed -i "s/#ffffff/${theme_color_border:-#ffffff}/g" "${theme_filename}"
    sed -i "s/#ffffff/${theme_color_border:-#ffffff}/g" "${spinner_theme_filename}"

    # Change the accent color (nord/#8fbcbb)
    sed -i "s/#8fbcbb/${theme_color_accent:-#8fbcbb}/g" "${spinner_theme_filename}"

    # Change the green color - plus sign (Green/#00ff00)
    sed -i "s/#00ff00/${theme_color_green:-#00ff00}/g" "${theme_filename}"

    # Change the red color (Red/#ff0000)
    sed -i "s/#ff0000/${theme_color_red:-#ff0000}/g" "${theme_filename}"

    # Change the purple color (Purple/#800080)
    sed -i "s/#800080/${theme_color_purple:-#800080}/g" "${theme_filename}"

    # Change the orange color (Orange/#ff7f2a)
    sed -i "s/#ff7f2a/${theme_color_orange:-#ff7f2a}/g" "${theme_filename}"
}

run() {
    pushd "${script_dir}" >/dev/null || return 1

    # Remove old theme
    rm -rf "../${theme_name}"
    # Renders PNGs
    png_render "${script_dir}" "${theme_name}" >/dev/null 2>&1 &
    pid=$!
    animation $pid "${theme_name}"
    # Make X11 cursors
    echo "Making the X11 cursors for ${theme_name}..."
    # If this is a lefthand variant, we must use the lefthand hostspot file
    if [[ ${theme_name} =~ .*lefthand ]]; then
        "${script_dir}/make.sh" "${theme_name}" '-lefthand'
    else
        "${script_dir}/make.sh" "${theme_name}"
    fi

    if ${export_theme}; then
        archive_filename="${theme_name}.tar.gz"

        # Create archives
        echo "Making the archive for ${theme_name}..."
        {
            tar -zcf "../archives/${archive_filename}" "${theme_name}/"
        } >/dev/null
        sha256sum "../archives/${archive_filename}" >>../archives/checksums
    fi

    if [ -d "../xcursors/${theme_name}" ]; then
        rm -rf "../xcursors/${theme_name}"
    fi
    mv "${theme_name}"/ ../xcursors/

    popd >/dev/null || return 1
    echo "The cursors theme is finished!"
}

ascii_art
export_theme=false
while [[ "$#" -gt 0 ]]; do
    case "${1:-}" in
    -h | --help)
        usage
        exit 0
        ;;
    -n | --name)
        theme_name=${2}
        shift 2
        ;;
    -f | --fill)
        theme_color_fill=${2}
        shift 2
        ;;
    -b | --border)
        theme_color_border=${2}
        shift 2
        ;;
    -a | --accent)
        theme_color_accent=${2}
        shift 2
        ;;
    -p | --purple)
        theme_color_purple=${2}
        shift 2
        ;;
    -g | --green)
        theme_color_green=${2}
        shift 2
        ;;
    -r | --red)
        theme_color_red=${2}
        shift 2
        ;;
    -o | --orange)
        theme_color_orange=${2}
        shift 2
        ;;
    -A | --archive)
        export_theme=true
        shift 1
        ;;
    -l | --lefthand)
        left_hand='-lefthand'
        shift 1
        ;;
    -R | --righthand)
        # a bit dumb but I don't want to do something smarter heh
        shift 1
        ;;
    *)
        echo "Unrecognized parameter ${1}"
        exit 1
        ;;
    esac
done

theme_name="${theme_name}${left_hand}"
svg_template_main="${script_dir}/svgs/nordzy-templates/Nordzy-cursors${left_hand}-template.svg"
svg_template_spinner="${script_dir}/svgs/nordzy-templates/Nordzy-cursors${left_hand}-spinner-template.svg"

generate_colored_svg
run
