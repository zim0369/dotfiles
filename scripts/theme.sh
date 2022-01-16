#!/bin/sh

if rg -q "dark" /tmp/theme
then
    cp /home/zim/github/dotfiles/config/alacritty/alacritty.light.yml /home/zim/.config/alacritty/alacritty.yml
    echo "light" > /tmp/theme
else
    cp /home/zim/github/dotfiles/config/alacritty/alacritty.dark.yml /home/zim/.config/alacritty/alacritty.yml
    echo "dark" > /tmp/theme
fi
