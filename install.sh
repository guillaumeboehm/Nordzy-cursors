#!/usr/bin/env bash

ROOT_UID=0
DEST_DIR=

script_dir="$(realpath "$(dirname "${0}")")"

show_help() {
    # Display Help
    echo "usage: install.sh [options]"
    echo
    echo "options:"
    echo "  -h, --help                   Show this help"
    echo "  -p, --hyprcursors            Install the hyprcursors alongside the xcursors"
    echo "  -P, --hyprcursors-only       Install the hyprcursors variants only"
    echo
}

if ! VALID_ARGS=$(getopt -o hpP --long help,hyprcursors.hyprcursors-only -- "$@"); then
    exit 1
fi

hyprcursors_gen=false
xcursors_gen=true

eval set -- "$VALID_ARGS"
while true; do
    case "$1" in
    -h | --help)
        show_help
        exit 0
        ;;
    -p | --hyprcursors)
        hyprcursors_gen=true
        shift
        ;;
    -P | --hyprcursors-only)
        hyprcursors_gen=true
        xcursors_gen=false
        shift
        ;;
    --)
        shift
        break
        ;;
    esac
done

# Display ascii art
ascii_art() {
    cat <${script_dir}/resources/nordzy-ascii-art.txt
    sleep 0.5
}

# Destination directory
if [ "$UID" -eq "$ROOT_UID" ]; then
    DEST_DIR="/usr/share/icons"
else
    DEST_DIR="$HOME/.local/share/icons/"
    if [ ! -d "$DEST_DIR" ]; then
        mkdir -p "$DEST_DIR"
    fi
fi

ascii_art

themes_paths=""
if ${xcursors_gen}; then
    themes_paths="${themes_paths} ${script_dir}/xcursors"
fi
if ${hyprcursors_gen}; then
    themes_paths="${themes_paths} ${script_dir}/hyprcursors/themes"
fi

for themes_path in ${themes_paths}; do
    for theme in "${themes_path}/"*; do
        if [ -d "${DEST_DIR}/${theme}" ]; then
            rm -rf "${DEST_DIR:?}/${theme}"
        fi
        cp -r "$theme" "$DEST_DIR"
    done
done
echo "Themes installed!"
