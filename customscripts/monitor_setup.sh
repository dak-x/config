#! /bin/bash
if [ "$#" -ne 1 ]; then
	echo usage $0 "1|2|3|4"
	exit 1
fi

if test $1 -eq "1"; then
	echo "Switching to only eDP screen, shutting down HDMI"
	xrandr --output eDP --mode 1920x1080  --output HDMI-A-0 --off
    xmonad --restart

elif test $1 -eq "2"; then
	echo "Switching to only HDMI screen, shutting down eDP"
	xrandr --output eDP --off --output HDMI-A-0 --mode 1680x1050  --primary --right-of eDP
    xmonad --restart

elif test $1 -eq "3"; then
	echo "Switching to both screens left-HDMI right-eDP"
	xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1680x1050  --primary --left-of eDP
    xmonad --restart

elif test $1 -eq "4"; then 
	echo "Switching to both screens left-eDP right-HDMI"
	xrandr --output eDP --mode 1920x1080 --output HDMI-A-0 --mode 1680x1050  --primary --right-of eDP
    xmonad --restart

else 
	echo "Option Not Recognized. Use the Following:"
	echo "1. Switch to only eDP screen, shutting down monitor"
	echo "2. Switch to only HDMI screen, shutting down monitor"
	echo "3. Switch to both screens left-HDMI right-eDP"
	echo "4. Switch to both screens left-eDP right-HDMI"
fi


