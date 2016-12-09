sum/total < RANDOM/32767	{ name=$1; audio=$(NF-1) }
				{ sum+=$NF }
END	{ if (length(volumeoption) != 0) {
		printf("%s %d %s", volumeoption, audio, name) }
	else {
		printf("%s", name) } }
