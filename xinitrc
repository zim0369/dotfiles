#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then







    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then







    xrdb -merge "$userresources"

fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# Remap escape key
setxkbmap -option caps:swapescape # sudo loadkeys ~/.keystrings (in tty)

# Change all the alt keys to super and vice-versa
setxkbmap -option altwin:swap_alt_win

# pulseaudio
pulseaudio --start &

# networking
connman-gtk --use-fsid

# statusbar
/opt/bar/dwm_bar.sh &
 
# background 
feh --randomize --bg-scale ~/pictures/*

# loop
while true; do
	dwm > /dev/null 2>&1
done

exec dwm
