Please read the instructions and install the following packages before using any of the configs to avoid a bad experience :

i3 : scrot(screenshots), polybar(statusbar), picom(compositor), feh(backgrounds), libinput-gestures(optional), i3lock, pulseaudio(audio), rofi(app menu),...

ranger : fzf(fuzzyfinder), mlocate(fuzzyfinder), findutils(fuzzyfinder), dragon-drag-and-drop(available in the aur), cmus(music on console), ueberzug(images), ... 
		 Use C-x -> Dragon drag and drop 
		 Use C-g -> fuzzfinder locate 

alacritty : To select themes :
            run -> npm install npx 
            run -> npx alacritty-themes 

zsh : Install zsh autosuggestions package, zsh syntax highlight from here : https://medium.com/macoclock/how-to-add-auto-suggestion-and-syntax-highlighting-macos-linux-terminal-2f168bdd790 

vim : Install junegun's vim-plug and then run :PlugInstall 
	  I personally like to use a dark(#000000) background for my terminal, configure accordingly.
	  <F8> : Build programs 
	  <F9> : run programs 
	  <F10> : switch between different numbering styles
	  <F11> : Paste mode 

picom : 

tmux : Install tmux-plugin tpm and then :
	   C-a r (reload config) 
       C-a I (Install Plugins) 
       C-a U (Update Plugins) 
       
       Use C-t : new-tab
       Use C-d : previous-tab 
       Use C-f : next-tab 

Polybar : pulseaudio(audio), run : alsactl restore(If mic/speakers not working properly)
	    : config file is a bit crappy but to enable other modules dig through the configs 
