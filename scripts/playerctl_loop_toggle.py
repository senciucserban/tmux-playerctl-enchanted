#!/usr/bin/env python
import subprocess


def main():
    status_mapping = {
        'None': 'Playlist',
        'Playlist': 'Track',
        'Track': 'None'
    }

    status = subprocess.check_output(['playerctl', 'loop']).decode().strip()
    subprocess.call(['playerctl', 'loop', status_mapping[status]])


if __name__ == '__main__':
    main()
