#!/usr/bin/env sh
while [ "$player" = "" -o "$player" = "No players found" ]; do
	player=$(playerctl --list-all 2> /dev/null | grep -v 'qutebrowser' | head -1)
	sleep 1
done

shuffle() {
	playerctl -F shuffle | while read line; do
		case $line in
			On)
				echo "{\"icon\":\"󰒟\", \"command\":\"playerctl --player $player shuffle off\"}";;
			Off)
				echo "{\"icon\":\"󰒞\", \"command\":\"playerctl --player $player shuffle on\"}";;
		esac
	done
}

status() {
	playerctl -F status | while read line; do
		case $line in
			Playing)
				echo "{\"icon\":\"\", \"command\":\"playerctl --player $player pause\"}";;
			Paused)
				echo "{\"icon\":\"\", \"command\":\"playerctl --player $player play\"}";;
		esac
	done
}

loop() {
	playerctl -F loop | while read line; do
		case $line in
			Playlist)
				echo "{\"icon\":\"󰑖\", \"command\":\"playerctl --player $player loop track\"}";;
			Track)
				echo "{\"icon\":\"󰑘\", \"command\":\"playerctl --player $player loop none\"}";;
			None)
				echo "{\"icon\":\"󰑗\", \"command\":\"playerctl --player $player loop playlist\"}";;
		esac
	done
}

case $1 in
	shuffle)
		shuffle;;
	status)
		status;;
	loop)
		loop;;
esac
