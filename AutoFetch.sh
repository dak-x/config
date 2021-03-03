#!/usr/bin/fish
cp -r ~/.config/alacritty ./
cp -r ~/.config/fish ./
cp ~/.config/Code/User/settings.json ./vscode/settings.json
cp ~/.config/Code/User/keybindings.json ./vscode/keybindings.json
cp -r ~/.config/polybar/blocks ./polybar/
cp ~/.xmonad/xmonad.hs ./
cp /usr/local/bin/*.sh ./customscripts/

echo "Last updated :" (date) > msg.txt
git add .
git commit -F msg.txt
git push