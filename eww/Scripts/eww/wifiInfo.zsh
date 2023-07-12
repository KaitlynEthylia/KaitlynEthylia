#!/usr/bin/env zsh
case $1 in
	name)
		nmcli -f IN-USE,SSID d w | grep '*' | sed 's/[\* ]//g' | cat
		exit 0;;
	strength)
		case $(nmcli -f IN-USE,BARS d w |
				grep '*' |
				sed 's/[\* ]//g') in
		▂▄▆█)
			echo "󰤨";;
		▂▄▆_)
			echo "󰤥";;
		▂▄__)
			echo "󰤢";;
		▂___)
			echo "󰤟";;
		*)
			echo "󰤯";;
		esac
		exit 0;;
	colour)
		case $(nmcli -f IN-USE,BARS d w |
				grep '*' |
				sed 's/[\* ]//g') in
		▂▄▆█)
			echo "green";;
		▂▄▆_)
			echo "yellow";;
		▂▄__)
			echo "peach";;
		▂___)
			echo "maroon";;
		*)
			echo "red";;
		esac
		exit 0;;
esac
