#!/bin/bash

# Init Starship
eval "$(starship init bash)"

# Init Cargo
. "/home/f-robot/.cargo/env"

# Init FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Init NVM
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"                    # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
