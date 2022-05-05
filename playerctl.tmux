#!/usr/bin/env bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CWD/scripts/helpers.sh"

playerctl_short="#($CWD/scripts/playerctl_short.sh)"
playerctl_short_interpolation="\#{playerctl_short}"

playerctl_loop_status="#($CWD/scripts/playerctl_loop_status.sh)"
playerctl_loop_status_interpolation="\#{playerctl_loop_status}"

playerctl_play_status="#($CWD/scripts/playerctl_play_status.sh)"
playerctl_play_status_interpolation="\#{playerctl_play_status}"

playerctl_shuffle_status="#($CWD/scripts/playerctl_shuffle_status.sh)"
playerctl_shuffle_status_interpolation="\#{playerctl_shuffle_status}"

playerctl_loop_toggle="#($CWD/scripts/playerctl_loop_toggle.sh)"
playerctl_loop_toggle_interpolation="\#{playerctl_loop_toggle}"


do_interpolation() {
  local string=$1
  local string=${string/$playerctl_short_interpolation/$playerctl_short}
  local string=${string/$playerctl_loop_status_interpolation/$playerctl_loop_status}
  local string=${string/$playerctl_play_status_interpolation/$playerctl_play_status}
  local string=${string/$playerctl_shuffle_status_interpolation/$playerctl_shuffle_status}
  local string=${string/$playerctl_loop_toggle_interpolation/$playerctl_loop_toggle}
  echo "$string"
}

update_tmux_option() {
  local option="$1"
  local option_value="$(get_tmux_option "$option")"
  local new_option_value="$(do_interpolation "$option_value")"

  tmux set-option -gq "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}

main
