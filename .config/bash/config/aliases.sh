#!/bin/bash

# Demonized Apps
alias whap="dae whatsapp-4linux"
alias postman="dae postman"
alias firefox="dae firefox"
alias discord="dae discord"
alias notion="dae notion-snap"
alias obsidian="dae obsidian"
alias thunderbird="dae thunderbird"
alias slack="dae slack"
alias ytmusic="dae ~/Applications/ytmusic.AppImage"
alias hollow-knight=". ~/Games/GOG\ Games/Hollow\ Knight/start.sh"

# Shortcuts Aliases
alias cr="clear"
alias ex="exit"
alias nv="nvim"
alias rm="trash"
alias apt="sudo apt"
alias snap="sudo snap"
alias dpkg="sudo dpkg"
alias mkdir="mkdir --parents"         # Make missing parent directories when creating folders
alias du="du --max-depth=1 --si"      # Display size of files and folders under current directory.
alias df="df --all --si --print-type" # Display all disk usage statistics with SI units and FS types.
alias mv="mv --interactive --verbose" # Move nodes with interactive mode and extra verbosity.
alias cp="cp --interactive --verbose" # Copy nodes with interactive mode and extra verbosity.
alias ln="ln --interactive --verbose" # Link nodes with interactive mode and extra verbosity.

# Edit config files
alias tmrc="cd ~/.config/kitty/ && nvim ~/.config/kitty/kitty.conf"
alias nvrc="cd ~/.config/nvim/ && nvim init.lua"
alias shrc="cd ~/.config/bash/ && nvim .bashrc"
alias bashrc="source ~/.bashrc"

# APT Aliases
alias search="apt search"
alias install="apt install"
alias clean="apt autoremove && apt autopurge"
alias update="apt update && apt upgrade -y && npm update -g && snap refresh && nvim --headless +PackerSync +qa"

# Usefule Aliases
alias deact="deactivate"
alias act="source venv/bin/activate"
alias logout="loginctl terminate-user ricardo"
alias kitty-update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"

# LSD
alias ls="lsd"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

## Git
alias ga="git add"
alias gd="git diff"
alias gt="git stash"
alias gb="git branch"
alias gs="git status"
alias gr="git restore"
alias ge="git checkout"
alias gp="git stash pop"
alias gc="git commit -m "
alias gps="git push origin"
alias gpl="git pull origin"
alias gl="git log --oneline"
alias gds="git diff --staged"
alias grs="git restore --staged"
alias grm="git rm -fr --cached ."
alias gca="git commit --amend -m"
alias gac="git add . && git commit -m"

# NPM
alias ns="npm start"
alias ni="npm install"
alias nd="npm run dev"
alias nt="npm run test"
alias ns="npm run serve"
alias nb="npm run build"
alias ne="npm run deploy"

# NPM
alias pi="pip install"
alias pu="pip uninstall"
alias pir="pip install -r requirements.txt"

# PM2
alias pl="pm2 log"
alias pi="pm2 list"
alias ps="pm2 stop"
alias pd="pm2 delete" 
alias pr="pm2 restart"
alias pss="pm2 start npm -- start"
alias psd="pm2 start npm -- run dev"
alias pse="pm2 start npm -- run serve"
alias pdc="pm2 start --name compose docker -- compose up --build"

# Conditional aliases
if command -v batcat &>/dev/null; then
	alias cat="bat"
else
  echo "batcat command does not exist :("
fi

alias firebase="echo 'Confirma este deploy y utiliza la ruta absoluta'"

# Firebase aliases
alias fdp="nb && /home/ricardo/.nvm/versions/node/v16.18.0/bin/firebase hosting:channel:deploy prueba"
alias fl="/home/ricardo/.nvm/versions/node/v16.18.0/bin/firebase hosting:channel:list"
