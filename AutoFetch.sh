#!/usr/bin/fish

# alacritty
cp -r ~/.config/alacritty ./

# userChrome.css
cp -r ~/.mozilla/firefox/nnx6yqym.default-release/chrome ./

# fish state
cp -r ~/.config/fish ./

# vs code settings and shortcuts
cp ~/.config/Code/User/settings.json ./vscode/settings.json
cp ~/.config/Code/User/keybindings.json ./vscode/keybindings.json

# polybar
cp -r ~/.config/polybar/material ./polybar/

# bspwm <3
cp -r ~/.config/bspwm/ ./bspwm
cp -r ~/.config/sxhkd/ ./sxhkd

# scripts
cp /usr/local/bin/*.sh ./customscripts/
cp /usr/local/bin/dyWall.py ./customscripts/



echo "Last updated :" (date) > msg.txt

git add .
git commit -F msg.txt
git push

