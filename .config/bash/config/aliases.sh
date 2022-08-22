#!/bin/bash

# Demonized Apps
alias whap="dae whatsdesk"
alias firefox="dae firefox"
alias discord="dae discord"
alias notion="dae notion-snap"
alias thunderbird="dae thunderbird"
alias ytmusic="dae ~/Applications/Music.AppImage"

# Shortcuts Aliases
alias cr="clear"
alias ex="exit"
alias nv="nvim"
alias rm="trash" # Use 'trash' command instead 'rm'
alias apt="sudo apt"
alias snap="sudo snap"
alias dpkg="sudo dpkg"
alias docker="sudo docker"
alias mkdir="mkdir --parents"         # Make missing parent directories when creating folders
alias du="du --max-depth=1 --si"      # Display size of files and folders under current directory.
alias df="df --all --si --print-type" # Display all disk usage statistics with SI units and FS types.
alias mv="mv --interactive --verbose" # Move nodes with interactive mode and extra verbosity.
alias cp="cp --interactive --verbose" # Copy nodes with interactive mode and extra verbosity.
alias ln="ln --interactive --verbose" # Link nodes with interactive mode and extra verbosity.

# Edit config files
alias tmrc="cd ~/.config/kitty && nvim ~/.config/kitty/kitty.conf"
alias nvrc="cd ~/.config/nvim/ && nvim init.lua"
alias shrc="cd ~/.config/bash/ && nvim .bashrc"

# APT Aliases
alias search="apt search"
alias install="apt install"
alias clean="apt autoremove && apt autopurge"
alias update="apt update -y && apt upgrade -y"

# Usefule Aliases
alias deact="deactivate"
alias bashrc="source ~/.bashrc"
alias act="source venv/bin/activate"
alias logout="loginctl terminate-user ricardo"
alias init="git init && npm init -y && npx gitignore node"
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
alias gs="git stash"
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

# NPM
alias ns="npm start"
alias ni="npm install"
alias nd="npm run dev"
alias nt="npm run test"
alias ns="npm run serve"
alias nb="npm run build"
alias ne="npm run deploy"

# PM2
alias pl="pm2 log"
alias pi="pm2 list"
alias ps="pm2 stop"
alias pd="pm2 delete" 
alias pr="pm2 restart"
alias pss="pm2 start npm -- start"
alias psd="pm2 start npm -- run dev"
alias pse="pm2 start npm -- run serve"

# Conditional aliases
if command -v batcat &>/dev/null; then
	alias cat="bat"
else
  echo "batcat command does not exist :("
fi

# Firebase aliases
alias fdp="nb && firebase hosting:channel:deploy prueba"
alias fdl="nb && firebase hosting:channel:list"
