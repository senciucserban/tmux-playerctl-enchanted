#!/usr/bin/env bash

main() {
    status=$(playerctl status)
    if [ "$status" = 'Paused' ]; then
        status_icon='⏸️  '
    else
        status_icon='▶️ '
    fi

    echo "$status_icon"
}

main
