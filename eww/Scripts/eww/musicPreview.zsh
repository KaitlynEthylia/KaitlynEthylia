dbus-monitor "
	interface='org.freedesktop.DBus.Properties',
	member='PropertiesChanged',
	arg0='org.mpris.MediaPlayer2.Player'" |
		grep --line-buffered 'scdn' |
		while read -r line; do
			url=$(echo $line |
			sed 's/^.*"https\(.*\)"$/http\1/')
			echo "nya $url uwu"
		done
