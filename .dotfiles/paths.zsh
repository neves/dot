# Local NodeJs https://github.com/mklement0/n-install
# export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"

# faster nokogiri install
export -U NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# desligar autocorrect
unsetopt Correct

# yarn bin path
PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# add python pip bin path
PATH="$HOME/.local/bin:$PATH"

# add ni node
PATH="$HOME/ni/node/bin:$PATH"

# add local bin folder to path
PATH=".git/safe/../../bin:node_modules/.bin:$PATH" # mkdir .git/safe

export -U PATH
