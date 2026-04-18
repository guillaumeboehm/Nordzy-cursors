#!/bin/bash

script_dir="$(realpath "$(dirname "${0}")")"

pushd "${script_dir}" >/dev/null || exit 1

set -- "--righthand" "--lefthand"
# Create all the theme with one script
for hand in "$@"; do

    ################
    #### NORDZY ####
    ################
    # Nordzy-cursors
    bash custom_theme.sh --name "Nordzy-cursors" --fill "#2e3440" --border "#d8dee9" --accent "#8fbcbb" --purple "#5e81ac" --green "#a3be8c" --red "#bf616a" --orange "#d08770" --archive "${hand}"

    # Nordzy-cursors-white
    bash custom_theme.sh --name "Nordzy-cursors-white" --fill "#d8dee9" --border "#2e3440" --accent "#8fbcbb" --purple "#5e81ac" --green "#a3be8c" --red "#bf616a" --orange "#d08770" --archive "${hand}"

    ####################
    #### CATPPUCCIN ####
    ####################

    ## LATTE ##
    # Rosewater
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-rosewater" --fill "#dc8a78" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Flamingo
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-flamingo" --fill "#dd7878" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Pink
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-pink" --fill "#ea76cb" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Mauve
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-mauve" --fill "#8839ef" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Red
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-red" --fill "#d20f39" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Maroon
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-maroon" --fill "#e64553" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Peach
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-peach" --fill "#fe640b" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Yellow
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-yellow" --fill "#df8e1d" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Green
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-green" --fill "#40a02b" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Teal
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-teal" --fill "#179299" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Sky
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-sky" --fill "#04a5e5" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Sapphire
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-sapphire" --fill "#209fb5" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Blue
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-blue" --fill "#1e66f5" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Lavender
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-lavender" --fill "#7287fd" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Dark
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-dark" --fill "#4c4f69" --border "#eff1f5" --accent "#eff1f5" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"
    # Light
    bash custom_theme.sh --name "Nordzy-catppuccin-latte-light" --fill "#eff1f5" --border "#4c4f69" --accent "#4c4f69" --purple "#1e66f5" --green "#40a02b" --red "#d20f39" --orange "#fe640b" "${hand}"

    ## FRAPPE ##
    # Rosewater
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-rosewater" --fill "#f2d5cf" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Flamingo
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-flamingo" --fill "#eebebe" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Pink
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-pink" --fill "#f4b8e4" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Mauve
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-mauve" --fill "#ca9ee6" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Red
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-red" --fill "#e78284" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Maroon
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-maroon" --fill "#ea999c" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Peach
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-peach" --fill "#ef9f76" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Yellow
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-yellow" --fill "#e5c890" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Green
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-green" --fill "#a6d189" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Teal
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-teal" --fill "#81c8be" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Sky
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-sky" --fill "#99d1db" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Sapphire
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-sapphire" --fill "#85c1dc" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Blue
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-blue" --fill "#8caaee" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Lavender
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-lavender" --fill "#babbf1" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Dark
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-dark" --fill "#303446" --border "#c6d0f5" --accent "#c6d0f5" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"
    # Light
    bash custom_theme.sh --name "Nordzy-catppuccin-frappe-light" --fill "#c6d0f5" --border "#303446" --accent "#303446" --purple "#8caaee" --green "#a6d189" --red "#e78284" --orange "#ef9f76" "${hand}"

    ## MACCHIATO ##
    # Rosewater
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-rosewater" --fill "#f4dbd6" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Flamingo
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-flamingo" --fill "#f0c6c6" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Pink
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-pink" --fill "#f5bde6" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Mauve
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-mauve" --fill "#c6a0f6" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Red
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-red" --fill "#ed8796" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Maroon
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-maroon" --fill "#ee99a0" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Peach
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-peach" --fill "#f5a97f" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Yellow
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-yellow" --fill "#eed49f" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Green
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-green" --fill "#a6da95" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Teal
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-teal" --fill "#8bd5ca" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Sky
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-sky" --fill "#91d7e3" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Sapphire
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-sapphire" --fill "#7dc4e4" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Blue
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-blue" --fill "#8aadf4" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Lavender
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-lavender" --fill "#b7bdf8" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Dark
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-dark" --fill "#24273a" --border "#cad3f5" --accent "#cad3f5" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"
    # Light
    bash custom_theme.sh --name "Nordzy-catppuccin-macchiato-light" --fill "#cad3f5" --border "#24273a" --accent "#24273a" --purple "#8aadf4" --green "#a6da95" --red "#ed8796" --orange "#f5a97f" "${hand}"

    ## MOCHA ##
    # Rosewater
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-rosewater" --fill "#f5e0dc" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Flamingo
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-flamingo" --fill "#f2cdcd" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Pink
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-pink" --fill "#f5c2e7" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Mauve
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-mauve" --fill "#cba6f7" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Red
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-red" --fill "#f38ba8" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Maroon
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-maroon" --fill "#eba0ac" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Peach
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-peach" --fill "#fab387" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Yellow
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-yellow" --fill "#f9e2af" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Green
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-green" --fill "#a6e3a1" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Teal
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-teal" --fill "#94e2d5" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Sky
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-sky" --fill "#89dceb" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Sapphire
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-sapphire" --fill "#74c7ec" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Blue
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-blue" --fill "#89b4fa" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Lavender
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-lavender" --fill "#b4befe" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Dark
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-dark" --fill "#1e1e2e" --border "#cdd6f4" --accent "#cdd6f4" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
    # Light
    bash custom_theme.sh --name "Nordzy-catppuccin-mocha-light" --fill "#cdd6f4" --border "#1e1e2e" --accent "#1e1e2e" --purple "#89b4fa" --green "#a6e3a1" --red "#f38ba8" --orange "#fab387" "${hand}"
done

popd >/dev/null || exit 1
