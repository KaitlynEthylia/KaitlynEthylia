bold=$(tput bold)
normal=$(tput sgr0)

white=$(tput setaf 15)

rawPlayer=$(playerctl --list-all | grep -v 'firefox' | head -1)

rawShuffle=$(playerctl --player $rawPlayer shuffle)
shuffle=$(case $rawShuffle in
	On) 
		echo "咽";;
	Off)
		echo "劣";;
	*)
		echo "  ";;
esac)

rawStatus=$(playerctl --player $rawPlayer status)
status=$(case $rawStatus in
	Paused) 
		echo "契";;
	*)
		echo " ";;
esac)

rawLoop=$(playerctl --player $rawPlayer loop)
loop=$(case $rawLoop in
	None) 
		echo "稜";;
	Playlist)
		echo "凌";;
	Track)
		echo "綾";;
	*)
		echo "  ";;
esac)

printf "$white$shuffle $bold玲$status怜$normal $loop"
