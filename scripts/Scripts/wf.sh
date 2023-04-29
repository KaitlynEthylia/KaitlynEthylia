#!/usr/bin/env bash
pkill --euid "$USER" --signal SIGINT wf-recorder && exit
Coords=$(slurp) || exit
wf-recorder -g "$Coords" -f "$HOME/Pictures/Screenshots/file.mp4" || exit
