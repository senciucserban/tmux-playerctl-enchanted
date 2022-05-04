#!/usr/bin/env bash

main() {
    status=$(playerctl loop)
    if [ "$status" = 'None' ]; then
        status_icon=''
    else
        if [ "$status" = 'Track' ]; then
            status_icon='🔂'
        else
            status_icon='🔁'
        fi
    fi

    echo "$status_icon"
}

main
