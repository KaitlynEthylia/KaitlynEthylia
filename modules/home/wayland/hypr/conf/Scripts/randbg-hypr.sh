#!/usr/bin/env bash
Backgrounds=(~/Media/Backgrounds/*)
file=$((0 + RANDOM % ${#Backgrounds[@]}))
path=${Backgrounds[$file]}
monitor=$(hyprctl -j monitors | jq -r .[0].name)

hyprctl hyprpaper preload "$path"
hyprctl hyprpaper wallpaper "$monitor,$path"
hyprctl hyprpaper unload all