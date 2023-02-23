#!/usr/bin/env bash

while true
do
	Backgrounds=(~/Pictures/Backgrounds/*)

	file=$((0 + RANDOM % ${#Backgrounds[@]}))

	path=${Backgrounds[$file]}

	swaymsg output "*" bg "$path" fill

	sleep 10m
done
