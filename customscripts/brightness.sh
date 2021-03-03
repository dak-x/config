#! /bin/bash

cur_bright=$(cat /sys/class/backlight/amdgpu_bl0/brightness)
max_bright=$(cat /sys/class/backlight/amdgpu_bl0/max_brightness)

step="0.1"
step=$(printf "%.0f" "$(echo "$step * $max_bright" | bc -l)")

case "$1" in
	+)
		new_bright=$(echo "$cur_bright + $step" | bc -l);
		;;
	-)
		new_bright=$(echo "$cur_bright - $step" | bc -l);
		;;
	*)
		echo "Usage: $0 +|-"
		exit 1
		;;
esac

if ((new_bright < 0)); then
	new_bright="0"
fi
if ((new_bright > max_bright)); then
	new_bright="$max_bright"
fi

echo "$cur_bright -> $new_bright / $max_bright"
echo "$new_bright" | sudo tee /sys/class/backlight/amdgpu_bl0/brightness