#!/bin/bash

# Init Starship
eval "$(starship init bash)"

# Init Cargo
. "/home/ricardo/.cargo/env"

# Init FZF
[ -f ~/.fzf.bash ] && source /home/ricardo/.fzf.bash

# Init NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"
