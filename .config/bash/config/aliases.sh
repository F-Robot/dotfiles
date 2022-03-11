#!/bin/bash

# Shortcuts Aliases
alias cr="clear"
alias ex="exit"
alias deact="deactivate"
alias apt="sudo apt"
alias snap="sudo snap"
alias dpkg="sudo dpkg"
alias rm="trash" # Use 'trash' command instead 'rm'
alias nv="nvim"
alias mkdir="mkdir --parents" # Make missing parent directories when creating folders
alias mv="mv --interactive --verbose" # Move nodes with interactive mode and extra verbosity.
alias cp="cp --interactive --verbose" # Copy nodes with interactive mode and extra verbosity.
alias ln="ln --interactive --verbose" # Link nodes with interactive mode and extra verbosity.
alias du="du --max-depth=1 --si" # Display size of files and folders under current directory.
alias df="df --all --si --print-type" # Display all disk usage statistics with SI units and FS types.

# Usefule Aliases
alias logout="loginctl terminate-user ricardo"
alias nvrc="cd ~/.dotfiles/.config/nvim/ && nvim init.lua"
alias shrc="cd ~/.dotfiles/.config/bash/ && nvim .bashrc"
alias st="firefox && ytmusic && thunderbird && whap"
alias update="apt update -y && apt upgrade -y"
alias clean="apt autoremove && apt autopurge"
alias install="apt install"
alias sb="source ~/.bashrc"
alias act="source venv/bin/activate"
alias hi="npx husky-init && npm install"
alias hr="rm ./.husky/pre-commit && npx husky add .husky/commit-msg 'npx --no-install commitlint --edit \"$1\"'"

# List Aliases
alias ls="ls --color=auto"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Demonized Apps
alias firefox="dae firefox"
alias whap="dae whatsdesk"
alias discord="dae discord"
alias thunderbird="dae thunderbird"
alias ytmusic="dae youtube-music-desktop-app"

## Git
alias gl="git log --oneline"
alias ga="git add ."
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

# Firebase
alias fd="firebase deploy"
