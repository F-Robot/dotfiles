#!/bin/bash

# Demonized Apps
alias firefox="dae firefox"
alias whap="dae whatsdesk"
alias discord="dae discord"
alias thunderbird="dae birdtray"
alias ytmusic="dae ~/Applications/Music.AppImage"
alias notion="dae notion-snap"
alias todo="cd && nv ~/Documents/Shopnet/toDoList.txt"

# Shortcuts Aliases
alias st="firefox && whap && thunderbird && notion && ytmusic"
alias cr="clear"
alias ex="exit"
alias nv="nvim"
alias fx="firefox"
alias rm="trash" # Use 'trash' command instead 'rm'
alias apt="sudo apt"
alias snap="sudo snap"
alias dpkg="sudo dpkg"
alias docker="sudo docker"
alias deact="deactivate"
alias mkdir="mkdir --parents"         # Make missing parent directories when creating folders
alias mv="mv --interactive --verbose" # Move nodes with interactive mode and extra verbosity.
alias cp="cp --interactive --verbose" # Copy nodes with interactive mode and extra verbosity.
alias ln="ln --interactive --verbose" # Link nodes with interactive mode and extra verbosity.
alias du="du --max-depth=1 --si"      # Display size of files and folders under current directory.
alias df="df --all --si --print-type" # Display all disk usage statistics with SI units and FS types.

# Usefule Aliases
alias logout="loginctl terminate-user ricardo"
alias tmrc="cd ~/.config/kitty && nvim ~/.config/kitty/kitty.conf"
alias nvrc="cd ~/.config/nvim/ && nvim init.lua"
alias shrc="cd ~/.config/bash/ && nvim .bashrc"
alias update="apt update -y && apt upgrade -y"
alias kitty-update="curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin"
alias clean="apt autoremove && apt autopurge"
alias install="apt install"
alias search="apt search"
alias sb="source ~/.bashrc"
alias act="source venv/bin/activate"
alias hi="npx husky-init && npm install"
alias hr="rm ./.husky/pre-commit && npx husky add .husky/commit-msg 'npx --no-install commitlint --edit \"$1\"'"

# LSD
alias ls="lsd"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# LS
# alias ls="ls --color=auto"
# alias ll="ls -alF"
# alias la="ls -A"
# alias l="ls -CF"

## Git
alias gl="git log --oneline"
alias ga="git add"
alias gb="git branch"
alias gs="git status"
alias ge="git checkout"
alias gc="git commit -m "
alias gca="git commit --amend -m"
alias gps="git push origin"
alias gpl="git pull origin"
alias grm="git rm -fr --cached ."
alias gd="git diff"
alias gds="git diff --staged"
alias gr="git restore"
alias grs="git restore --staged"
alias gi="git init && npm init -y && npx gitignore node"

# NPM
alias ns="npm start"
alias ni="npm install"
alias nd="npm run dev"
alias nt="npm run test"
alias nb="npm run build"
alias ne="npm run deploy"

# PM2
alias psa="pm2 start npm -- start"
alias psd="pm2 start npm -- run dev"
alias pso="pm2 stop"
alias pli="pm2 list"
alias plo="pm2 log"
alias pr="pm2 restart"
alias pd="pm2 delete" 

# Conditional aliases
if command -v batcat &>/dev/null; then
	alias cat="bat"
else
  echo "batcat command does not exist :("
fi

alias fdp="nb && firebase hosting:channel:deploy prueba"
