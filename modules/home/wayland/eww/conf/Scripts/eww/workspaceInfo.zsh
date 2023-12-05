#!/usr/bin/env zsh
function clamp {
	python -c "print(max($1, min($3, $2)))"
}

function spaces {
	WORKSPACE_WINDOWS=$(hyprctl workspaces -j |
		jq 'map({key: .id | tostring, value: .windows}) | from_entries')
	seq 1 5 | jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})'
}

case $1 in
	change)
		current=$3
		case $2 in 
			down)  
				target=$(clamp 1 10 $(($current+1)));;
			up)    
				target=$(clamp 1 10 $(($current-1)));;
		esac
		hyprctl dispatch workspace $target;;
	get)
		spaces
		socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | 
			while read -r line; do
				spaces
			done;;
	active)
		hyprctl activeworkspace -j | jq --raw-output .id
		socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|, ' '/^workspace>>/{print $2}';;
	window)
		hyprctl activewindow -j | jq --raw-output .title 
		socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | stdbuf -o0 awk -F '>>|,' \
		'/^activewindow>>/ {print $3}';;
esac
