sum/total < RANDOM/32767	{ name=$1 }
				{ sum+=$NF }
END	{ printf("%s", name) }
