sum/total < RANDOM/32767	{ audio=$(NF-1) }
				{ sum+=$NF }
END	{ if (length(volumeoption) != 0) { printf("%s %d", volumeoption, audio) } }
