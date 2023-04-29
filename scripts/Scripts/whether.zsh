#!/usr/bin/env zsh
if curl=$(curl 'https://wttr.in/?0?q?T' --max-time 1 --no-progress-meter); then
	echo $curl | awk '/°(C|F)/ {printf $(NF-1) $(NF)}'
else
	printf 'Unavailable'
fi
