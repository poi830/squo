#!/bin/bash

audiodisplay=""
playlist="playlist.txt"
config="$HOME/.config/squo/config"

if [ ! -e $config ]; then
	mkdir -p "$HOME/.config/squo"
	echo "-v" > $config
fi

while read -r line || [[ -n "$line" ]]; do
	if [[ $line = "-h" ]]; then
		printf "Simple music player allowing you to change how often a song plays and at what volume.\nUsage: player.sh playlist\n"
		exit 0
	elif [[ $line = "-v" ]]; then
		audiodisplay="--no-audio-display"
	elif [[ $line = "-V" ]]; then
		audiodisplay=""
	fi
done < $config

for i in "$@"; do
	if [[ $i = "-h" ]]; then
		printf "Simple music player allowing you to change how often a song plays and at what volume.\nUsage: player.sh playlist\n"
		exit 0
	elif [[ $i = "-v" ]]; then
		audiodisplay="--no-audio-display"
	elif [[ $i = "-V" ]]; then
		audiodisplay=""
	else
		playlist=$i
	fi
done

directory=$(dirname -- "$(readlink -f -- "$0")")

while true; do
	total="`awk -f $directory/sum.awk $playlist`"
	rand=$RANDOM
	mpv $audiodisplay `awk -v total=$total -v RANDOM=$rand -f $directory/main.awk $playlist`
done
