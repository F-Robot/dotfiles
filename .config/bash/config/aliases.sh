#!/bin/bash

#Init Projects Aliases
alias npminit="git init && npm init -y && npx gitignore node && npx husky-init && npm install"
alias huskyinit="rm ./.husky/pre-commit && npx husky add .husky/commit-msg 'npx --no-install commitlint --edit \"$1\"'"

# List Aliases
alias ls="ls --color=auto"
alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

# Usefule Aliases
alias gitrepair="git rm -fr --cached ."
alias aptupdate="sudo apt update -y && sudo apt upgrade -y"
alias nvimrc="cd ~/.config/nvim/ && nvim init.lua"
alias bashrc="cd ~/.config/bash/ && nvim .bashrc"
alias logout="loginctl terminate-user ricardo"

# System Aliases
alias apt="sudo apt"
alias snap="sudo snap"
alias sb="source ~/.bashrc"
alias rm="trash" # Use 'trash' command instead 'rm'
alias mv="mv --interactive --verbose" # Move nodes with interactive mode and extra verbosity.
alias cp="cp --interactive --verbose" # Copy nodes with interactive mode and extra verbosity.
alias ln="ln --interactive --verbose" # Link nodes with interactive mode and extra verbosity.
alias mkdir="mkdir --parents" # Make missing parent directories when creating folders
alias du="du --max-depth=1 --si" # Display size of files and folders under current directory.
alias df="df --all --si --print-type" # Display all disk usage statistics with SI units and FS types.

# Shortcuts Aliases
alias act="source venv/bin/activate"
alias deact="deactivate"
alias firefox="dae firefox"
alias whap="dae whatsdesk"
alias discord="dae discord"
alias thunderbird="dae thunderbird"
alias ytmusic="dae youtube-music-desktop-app"

## Git
alias ga="git add ."
alias gs="git status"
alias gc="git commit -m "
alias gr="git restore"
alias gd="git diff"
alias gl="git log"

# NPM
alias ns="npm start"
alias nd="npm run dev"
alias nt="npm run test"
alias nb="npm run build"
alias ne="npm run deploy"
