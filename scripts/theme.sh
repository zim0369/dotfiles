#!/bin/sh

if rg -q "dark" /tmp/theme
then
    cp /home/zim/.github/dotfiles/config/urxvt/urxvt.light /home/zim/.Xresources
    xrdb /home/zim/.Xresources
    cp /home/zim/.github/dotfiles/config/alacritty/alacritty.light.yml /home/zim/.config/alacritty/alacritty.yml
    cat /tmp/light > /home/zim/.vim/theme.vim
    echo "light" > /tmp/theme
else
    cp /home/zim/.github/dotfiles/config/urxvt/urxvt.dark /home/zim/.Xresources
    xrdb /home/zim/.Xresources
    cp /home/zim/.github/dotfiles/config/alacritty/alacritty.dark.yml /home/zim/.config/alacritty/alacritty.yml
    cat /tmp/dark > /home/zim/.vim/theme.vim
    echo "dark" > /tmp/theme
fi
