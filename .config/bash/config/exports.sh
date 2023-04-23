#!/bin/bash

# PATH
export PATH="$HOME/.local/bin:$PATH"

# RIP_GREP
export RIPGREP_CONFIG_PATH="$HOME/.config/rg/"

# GCC
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Basics
export PAGER='less'
export EDITOR="nvim"

# FZF
## Command
export FZF_CTRL_T_COMMAND='fd --hidden --color always --type f'
export FZF_CTRL_R_COMMAND='rg --color always'
## Options
export FZF_CTRL_T_OPTS='--layout reverse --ansi'
export FZF_CTRL_R_OPTS='--layout reverse --ansi'

# NVIM
export NVM_DIR="$HOME/.nvm"

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"

case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
