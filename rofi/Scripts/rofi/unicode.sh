#!/usr/bin/env bash

if [[ $# -gt 0 ]]; then
	path=$(echo $@ |
		sed 's/\(.*\)/\L\1/')
	rofi -show emoji "emoji:$(which rofimoji) -f /lib/python3.10/site-packages/picker/data/$path.csv"
	exit 0
fi

for mode in $(find /lib/python3.10/site-packages/picker/data |
		sed 's/.*\/\(.*\).csv/\u\1/' |
		sed 's/\([-_]\)\(.\)/\1\u\2/g'|
		tail -n +2); do
	echo $mode
done
