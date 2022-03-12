#!/bin/bash

# GOLANG
export GOPATH="$HOME/.go"

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$GOPATH/bin"
export PATH="$HOME/.local/lib/lua-language-server/bin:$PATH"
# Basics
export EDITOR="nvim"
export NVM_DIR="$HOME/.nvm"
export BAT_THEME="OneHalfDark"
#export PAGER='less'

# Man
export MANWIDTH='100'
export MANPAGER='nvim +Man!'

# FZF
export FZF_ALT_C_COMMAND="fdfind --type d --hidden --color=always --exclude={.git,node_modules,build,*.png,*.jpg,.cache,venv,__pycache__,*.svg}"
export FZF_CTRL_T_COMMAND="fdfind --type f --hidden --color=always --exclude={.git,node_modules,build,*.png,*.jpg,.cache,venv,__pycache__,*.svg}"

export FZF_CTRL_T_OPTS="--height 40% --layout=reverse --ansi --preview 'bat --style numbers,changes --color=always {}'"
export FZF_ALT_C_OPTS="--height 40% --layout=reverse --ansi"
export FZF_CTRL_R_OPTS="--height 40% --layout=reverse --ansi"

# GCC
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# less
# export LESS="\
#   --ignore-case \
#   --tilde \
#   --chop-long-lines \
#   --status-column \
#   --LONG-PROMPT \
#   --jump-target=10 \
#   --RAW-CONTROL-CHARS \
#   --clear-screen \
#   --tabs=4 \
#   --shift=5"
# export LESSHISTFILE='-' # Disable history.
