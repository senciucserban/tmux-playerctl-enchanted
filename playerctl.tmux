#!/usr/bin/env bash

CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source "$CWD/scripts/helpers.sh"

playerctl_short="#($CWD/scripts/playerctl_short.sh)"
playerctl_short_interpolation="\#{playerctl_short}"

playerctl_loop_status="#($CWD/scripts/playerctl_loop_status.sh)"
playerctl_loop_status_interpolation="\#{playerctl_loop_status}"

do_interpolation() {
  local string=$1
  local string=${string/$playerctl_short_interpolation/$playerctl_short}
  local string=${string/playerctl_loop_status_interpolation/playerctl_loop_status}
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
