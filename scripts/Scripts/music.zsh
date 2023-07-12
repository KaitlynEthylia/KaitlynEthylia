#!/usr/bin/env zsh
bold=$(tput bold)
normal=$(tput sgr0)

red=$(tput setaf 9)
green=$(tput setaf 10)
yellow=$(tput setaf 11)
blue=$(tput setaf 12)
magenta=$(tput setaf 13)
cyan=$(tput setaf 14)
white=$(tput setaf 15)

# Player

rawPlayer=$(playerctl --list-all | grep -v 'firefox' | head -1)
player="$green$(echo $rawPlayer | sed 's/\(.\)/\u\1/')"

# Song

title=$(playerctl --player $rawPlayer metadata xesam:title)
artist=$(playerctl --player $rawPlayer metadata xesam:artist)

# Time

rawPosition=$(playerctl --player $rawPlayer position)

position=$(echo $rawPosition | sed 's/\..*//')
positionSeconds=$(($position % 60))
positionMinutes=$(($position / 60))

rawLength=$(playerctl --player $rawPlayer metadata mpris:length)

scaledLength=$(($rawLength / 1000000))
lengthSeconds=$(($scaledLength % 60))
lengthMinutes=$(($scaledLength / 60))

# Progress

rawProgress=$(($position * 10 / $scaledLength))
progress="$white"
for ((i=0; i<$rawProgress; i++)); do
	progress+="-"
done
progress+="$magenta\u25cf$white"
for ((i=9; i>$rawProgress; i--)); do
	progress+="-"
done

# Mode

rawShuffle=$(playerctl --player $rawPlayer shuffle)
shuffle=$(case $rawShuffle in
	On) 
		echo "\uf99e";;
	Off)
		echo "\uf99d";;
	*)
		echo "  ";;
esac)

rawStatus=$(playerctl --player $rawPlayer status)
_status=$(case $rawStatus in
	Paused) 
		echo "\uf909";;
	*)
		echo "\uf8e3 ";;
esac)

rawLoop=$(playerctl --player $rawPlayer loop)
loop=$(case $rawLoop in
	None) 
		echo "\uf956";;
	Playlist)
		echo "\uf955";;
	Track)
		echo "\uf957";;
	*)
		echo "  ";;
esac)

# Volume

rawVolume=$(playerctl --player $rawPlayer volume)
longVolume=$(echo $rawVolume | sed 's/0*\.//')
shortVolume=$(($longVolume / 100000))

volume="Volume: "
for ((i=0; i<$shortVolume; i++)); do
	if ((i == 0)); then
		volume+=$green
	elif ((i == 6)); then
		volume+=$yellow
	elif ((i == 9)); then
		volume+=$red
	fi
	volume+="\u275A"
done
volume+=$white

printf "$player$white:
$blue$bold$title$normal$white - $blue$bold$artist\n
  $yellow$positionMinutes$white:$yellow%02d $progress $yellow$lengthMinutes$white:$yellow%02d
      $white$shuffle $bold\uf9ad$_status\uf9ac$normal $loop
   $volume
" $positionSeconds $lengthSeconds
