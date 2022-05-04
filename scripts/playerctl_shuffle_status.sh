#!/usr/bin/env bash

main() {
    status=$(playerctl shuffle)
    if [ "$status" = 'On' ]; then
        status_icon='🔀'
    else
        status_icon=''
    fi

    echo "$status_icon"
}

main
