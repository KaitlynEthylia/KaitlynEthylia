#!/usr/bin/env zsh
	if wl-paste | iconv -f UTF8 > /dev/null; then
		case $1 in
			head)
				wl-paste |
					head -1 |
					awk 'length > 40{$0 = substr($0, 1, 40) "..."} {printf "%s", $0}' |
					sed 's/^[[:space:]]*//g'
				echo "";;
			all)
				wl-paste;;
		esac
	fi
