# tmux-plugin-playerctl

> Source of inspiration: [richin13/tmux-plugin-playerctl](https://github.com/richin13/tmux-plugin-playerctl)  

A tmux plugin for using [playerctl](https://github.com/acrisci/playerctl) to:
* Display [MPRIS](https://www.freedesktop.org/wiki/Specifications/mpris-spec/) meta-data about the music currently playing.
* Display player status: playing/paused, shuffle and repeat;
* Control the player using shortcuts: play, pause, stop, next, previous, loop, shuffle.


## Pre-requisites

Make sure you have *playerctl* installed.
See [playerctl](https://github.com/acrisci/playerctl#installing)'s instructions to get more details about installing it in other OS.

## Installation

### Installation with [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (recommended)

Add plugin to the list of TPM plugins in `.tmux.conf`:

```
set -g @plugin 'senciucserban/tmux-playerctl-enchanted'
```

Hit `prefix + I` to fetch the plugin and source it.

If format strings are added to `status-right`, they should now be visible.

### Manual installation

Clone the repository

```bash
git clone https://github.com/senciucserban/tmux-playerctl-enchanted ~/path/to/local/repo
```

Add the following line to your `.tmux.conf`:

```bash
run-shell ~/path/to/local/repo/playerctl.tmux
```


## Usage

The currently available options are:

- `#{playerctl_loop_status}`: Display the loop status None/Playlist/Track;
- `#{playerctl_play_status}`: Display the play status Playing/Paused;
- `#{playerctl_shuffle_status}`: Display the shuffle status On/Off;
- `#{playerctl_short}`: Display the song's information first 30 chars of `[Artist] - [Title]`;

Just add the desired option to your `.tmux.conf` like this:

```bash
set -g status-right "#{playerctl_full}"
```

### Shortcuts

You can set few shortcuts to control the player:

bind C-Space run-shell "playerctl play-pause"
bind C-Tab run-shell "playerctl shuffle Toggle"
- `bind C-Space run-shell "playerctl play-pause"` (CTRL + Space): Toggle play/pause;
- `bind C-Tab run-shell "playerctl shuffle Toggle"` (CTRL + Tab): Toggle shuffle;

## License

See [LICENSE](./LICENSE)
