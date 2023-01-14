#!/bin/bash

# PATH
export PATH="$HOME/.local/bin:$PATH"

# RIP_GREP
export RIPGREP_CONFIG_PATH="/home/ricardo/.config/rg/"

# GCC
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Basics
export PAGER='less'
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"

# FZF

## Command
export FZF_CTRL_T_COMMAND='fd --hidden --color always --type f'
export FZF_CTRL_R_COMMAND='rg --color always'

## Options
export FZF_CTRL_T_OPTS='--layout reverse --ansi'
export FZF_CTRL_R_OPTS='--layout reverse --ansi'
