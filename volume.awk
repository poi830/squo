sum/total < RANDOM/32767	{ audio=$2; extraoptions=$4 }
				{ sum+=$3 }
END	{ if (length(volumeoption) != 0) { printf("%s %d %s", volumeoption, audio, extraoptions) } }
