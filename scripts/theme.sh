#!/bin/bash

if [[ "$theme" == "dark" ]]
then
    cp /home/zim/.github/dotfiles/config/urxvt/urxvt.light /home/zim/.Xresources
    xrdb /home/zim/.Xresources
    cp /home/zim/.github/dotfiles/config/alacritty/alacritty.light.yml /home/zim/.config/alacritty/alacritty.yml
    sed -i --follow-symlinks "s/colorscheme.*/colorscheme $LIGHTO/g" /home/zim/.vimrc
    sed -i --follow-symlinks "s/set background=dark/set background=light/g" /home/zim/.vimrc
    sed -i --follow-symlinks "s/colorscheme.*/colorscheme $LIGHTO/g" /home/zim/.config/nvim/init.vim
    sed -i --follow-symlinks "s/set background=dark/set background=light/g" /home/zim/.config/nvim/init.vim
    export theme="light"
else
    cp /home/zim/.github/dotfiles/config/urxvt/urxvt.dark /home/zim/.Xresources
    xrdb /home/zim/.Xresources
    cp /home/zim/.github/dotfiles/config/alacritty/alacritty.dark.yml /home/zim/.config/alacritty/alacritty.yml
    sed -i --follow-symlinks "s/colorscheme.*/colorscheme $DARKO/g" /home/zim/.vimrc
    sed -i --follow-symlinks "s/set background=light/set background=dark/g" /home/zim/.vimrc
    sed -i --follow-symlinks "s/colorscheme.*/colorscheme $DARKO/g" /home/zim/.config/nvim/init.vim
    sed -i --follow-symlinks "s/set background=light/set background=dark/g" /home/zim/.config/nvim/init.vim
    export theme="dark"
fi
