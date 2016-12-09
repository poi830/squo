sum/total < RANDOM/32767	{ name=$1 }
				{ sum+=$3 }
END	{ printf("%s", name) }
