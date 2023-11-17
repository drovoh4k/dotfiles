#!/usr/bin/env bash
# ┬ ┬┌─┐┌─┐┬┌─┬┌┐┌┌─┐  ┬─┐┬┌─┐┌─┐
# ├─┤├─┤│  ├┴┐│││││ ┬  ├┬┘││  ├┤ 
# ┴ ┴┴ ┴└─┘┴ ┴┴┘└┘└─┘  ┴└─┴└─┘└─┘
#   (Font: ANSI - Calvin S 14pt)
#
# - By: drovoh4k (Based on: https://github.com/adi1090x/polybar-themes#forest)

# Set bspwm configuration for Hacking
set_bspwm_config() {
    bspc config border_width 0
    bspc config top_padding 40
    bspc config bottom_padding 2
    bspc config left_padding 2
    bspc config right_padding 2
    bspc config normal_border_color "#414868"
    bspc config active_border_color "#c0caf5"
    bspc config focused_border_color "#bb9af7"
    bspc config presel_feedback_color "#7aa2f7"
}

# Launch the bar
launch_bars() {

    for mon in $(polybar --list-monitors | cut -d":" -f1); do
        MONITOR=$mon polybar -q main -c ${rice_dir}/config.ini &
    done

}

### ---------- Apply Configurations ---------- ###
set_bspwm_config
launch_bars
