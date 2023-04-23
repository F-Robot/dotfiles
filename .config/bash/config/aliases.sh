#!/bin/bash

# system
alias ex="exit"
alias cl="clear"
alias mk="mkdir -p"
alias du="du --max-depth=1 --si"
alias mv="mv --interactive --verbose"
alias cp="cp --interactive --verbose"
alias ln="ln --interactive --verbose"
alias activate="source venv/bin/activate"
alias update="apt update && apt upgrade -y && npm update -g && snap refresh"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# git
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

# pip
alias pi="pip install"
alias pu="pip uninstall"
alias pir="pip install -r requirements.txt"

# lsd for ls (if lsd exists)
if command -v lsd &>/dev/null; then
  alias ls="lsd"
fi

# firebase
alias fp="firebase hosting:channel:deploy prueba"
alias fl="firebase hosting:channel:list"

# lsd
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

# pm2
alias pl="pm2 log"
alias pi="pm2 list"
alias ps="pm2 stop"
alias pd="pm2 delete" 
alias pr="pm2 restart"
alias pss="pm2 start npm -- start"
alias psd="pm2 start npm -- run dev"
alias psc="pm2 start --name docker-compose docker -- compose up --build"

# pnpm for npm (if pnpm exists)
if command -v pnpm &>/dev/null; then
	alias npm="pnpm"
fi

# npm
alias ns="npm start"
alias ni="npm install"
alias nd="npm run dev"
alias nt="npm run test"
alias ns="npm run serve"
alias nb="npm run build"
alias ne="npm run deploy"

# bat for cat (if batcat exists)
if command -v batcat &>/dev/null; then
	alias cat="bat"
fi

# trash-cli for rm (if trash-cli exists)
if command -v trash &>/dev/null; then
	alias rm="trash"
  alias rm-restore="trash-restore"
fi

