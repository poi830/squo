# squo

## usage

The script is called as `squo [-fhpvV] playlist`.

## playlists

Playlists are specified in the format "/path/to/song volume weight", with a song on each line. The weight specifies how often the song should be played. The default volume is 100, with higher values representing louder volumes. The path to the song cannot contain spaces due to limitations in my ability with awk.

## options

`-v` or `--no-av`: sets the `--no-audio-video` option in mpv

`-V` or `--av`: unsets the `--no-audio-video` option

`-h` or `--help`: prints a help message

`-p` or `--player`: allows you to choose a music player, default is `mpv`

`-f` or `--filename`: alternate method for choosing playlist name, default is `playlist.txt`

`--volumeoption`: sets option for setting volume, default is `volume`

## config

The config file is a list of options, one per line.
