# squo

## usage

The script is called as `squo [-vVh] playlist`.

## playlists

Playlists are specified in the format "/path/to/song volume weight", with a song on each line. The weight specifies how often the song should be played. The default volume is 100, with higher values representing louder volumes. The path to the song cannot contain spaces due to limitations in my ability with awk.

## options

`-v`: sets the `--no-audio-video` option in mpv
`-V`: unsets the `--no-audio-video` option
`-h`: prints a help message

## config

The config file is a list of options, one per line.
