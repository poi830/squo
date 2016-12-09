#!/bin/bash

audiodisplay=""
playlist="playlist.txt"
config="$HOME/.config/squo/config"
player="mpv"
volumeoption="--volume"

if [ ! -e $config ]; then
	mkdir -p "$HOME/.config/squo"
	echo "-v" > $config
fi

while read -r option arg1 || [[ -n "$line" ]]; do
	if [[ $option = "-v" ]]; then
		audiodisplay="--no-audio-display"
	elif [[ $option = "-V" ]]; then
		audiodisplay=""
	elif [[ $option = "-p" ]]; then
		player="$arg1"
	elif [[ $option = "-f" ]]; then
		playlist="$arg1"
	elif [[ $option = "--volumeoption" ]]; then
		volumeoption="$arg1"
	elif [[ ! ${option:0:1} = "#" ]]; then
		echo "Unrecognized option in config: $1"
	fi
done < $config

TEMP=`getopt -o h::v::V::p::f:: --long help::,no-av::,av::,player::,filename::,volumeoption:: -- "$@"`
eval set -- "$TEMP"

while true; do
	case "$1" in
		-h|--help)
			printf "Simple music player allowing you to change how often a song plays and at what volume.\nUsage: player.sh playlist\n"
			exit 0;;
		-v|--no-av)
			audiodisplay="--no-audio-display"; shift;;
		-V|--av)
			audiodisplay=""; shift;;
		-p|--player)
			player=$2; shift 2;;
		-f|--filename)
			playlist=$2; shift 2;;
		--volumeoption)
			volumeoption=$2; shift 2;;
		--)
			shift; break;;
		*)
			playlist=$1; shift;;
	esac
done

directory=$(dirname -- "$(readlink -f -- "$0")")

while true; do
	total="`awk -f $directory/sum.awk $playlist`"
	rand=$RANDOM
	$player $audiodisplay `awk -v total=$total -v RANDOM=$rand -v volumeoption=$volumeoption -f $directory/main.awk $playlist`
	echo "a"
done
