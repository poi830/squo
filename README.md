# squo

## usage

The script is called as `squo [OPTIONS] [playlist]`.

## playlists

Playlists are specified in the format "/path/to/song;volume;weight;song-specific options", with a song on each line. The weight specifies how often the song should be played. The default volume is 100, with higher values representing louder volumes. The path to the song cannot contain semicolons. The song-specific options are handed to the player. Any further fields are ignored and can be used as comments.

## options

`-v` or `--no-av`: sets the `--no-audio-video` option in mpv

`-V` or `--av`: unsets the `--no-audio-video` option

`-h` or `--help`: prints a help message

`-p` or `--player`: allows you to choose a music player, default is `mpv`

`-f` or `--filename`: alternate method for choosing playlist name, default is `playlist.txt`

`--volumeoption`: sets option for setting volume, default is `volume`

`-d` or `--delimiter`: sets the delimiter between fields in playlist (this can be a regex), default is `;`

`-e` or `--extraoptions`: sends the argument to the player

## config

The config file is a list of options, one per line.
