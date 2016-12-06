sum/total < RANDOM/32767	{ name=$1; audio=$(NF-1) }
				{ sum+=$NF }
END	{ printf("--volume %d %s", audio, name) }
