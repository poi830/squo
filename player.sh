#!/bin/bash

total="`awk -f /home/lahoti/Documents/scripts/bash/player/sum.awk $1`"
rand=$RANDOM
#volume=1
#while getopts v: OPTIONS
#do
#	case $opt in
#		v)
#			volume=$OPTARG;;
#		?)
#			printf "Invalid option: $OPTARG\nUsage: player.sh [-v volume] playlist"
#			exit 2;;
#	esac
#done
#volume=1
awk -v total=$total -v RANDOM=$rand -f /home/lahoti/Documents/scripts/bash/player/main.awk $1
