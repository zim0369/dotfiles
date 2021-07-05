cp -rd alacritty ~/.config/
cp -rd i3 ~/.config/
cp -rd picom ~/.config/
cp -rd polybar ~/.config/
cp -rd ranger ~/.config/
cp -rf vimrc ~/.vimrc 
cp -rf zshrc ~/.zshrc 
cp -rf tmux.conf ~/.tmux.conf 
cp -rf xinitrc ~/.xinitrc 

sudo cp -rf 40-libinput.conf /etc/X11/xorg.conf.d/
echo ''
echo "Please install these packages : feh scrot polybar picom i3lock pulseaudioo rofi \
    fzf mlocate findutils dragon-drag-and-drop cmus ueberzug cmus zsh gvim tmux \
    tpm(for tmux) vimplug(vim) pulseaudio alsa-utils font-awesome 5 siji-git and other \
    fonts listed in the polybar config file"
