#!/bin/bash

while getopts h OPTIONS
do
	case $opt in
		h)
			printf "Simple music player allowing you to change how often a song plays and at what volume.\nUsage: player.sh playlist"
			exit 0;;
		?)
			printf "Invalid option: $OPTARG\nUsage: player.sh playlist"
			exit 2;;
	esac
done
directory=$(dirname "$(test -L "$0" && readlink "$0" || echo "$0")")
while :;
do
	total="`awk -f $directory/sum.awk $1`"
	rand=$RANDOM
	mpv `awk -v total=$total -v RANDOM=$rand -f $directory/main.awk $1`
done
