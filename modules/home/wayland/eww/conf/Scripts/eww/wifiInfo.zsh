#!/usr/bin/env zsh
export CHARSET=ASCII
case $1 in
	name)
		nmcli -f IN-USE,SSID d w | grep '*' | sed 's/[\* ]//g' | cat
		exit 0;;
	strength)
		str=$(nmcli -f ACTIVE,BARS d w | grep 'yes' | tr -d ' yesno')
		case ${str: 0:-1} in
		'****')
			icon="󰤨"; colour="green";;
		'***')
			icon="󰤥"; colour="yellow";;
		'**')
			icon="󰤢"; colour="peach";;
		'*')
			icon="󰤟"; colour="maroon";;
		*)
			icon="󰤯"; colour="red";;
		esac
		echo "{\"icon\":\"$icon\",\"colour\":\"$colour\"}"
		exit 0;;
esac
