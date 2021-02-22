#!/usr/bin/fish
cp -r ~/.config/alacritty ./
cp -r ~/.config/fish ./
cp ~/.config/Code/User/settings.json ./vsCode/settings.json
cp ~/.config/Code/User/keybindings.json ./vsCode/keybindings.json
cp -r ~/.config/polybar/blocks ./polybar/
cp ~/.xmonad/xmonad.hs ./
echo "Last updated :" (date) > msg.txt
git add .
git commit -F msg.txt
git push