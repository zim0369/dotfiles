
git clone https://github.com/zim0369/dotfiles /home/$USER/dotfiles
cd ~/dotfiles 
echo "inside the repo" 
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
