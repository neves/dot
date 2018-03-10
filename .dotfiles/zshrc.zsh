source "${0:h}/elapse-timer/start.zsh"

source "${0:h}/prezto.zsh"
# source "${0:h}/asdf.zsh"
source "${0:h}/git.zsh"
source "${0:h}/yadm.zsh"
source "${0:h}/heroku.zsh"
source "${0:h}/aws.zsh"
source "${0:h}/gcloud.zsh"
source "${0:h}/functions.zsh"
source "${0:h}/aliases.zsh"
source "${0:h}/completion.zsh"

if [[ "$OSTYPE" =~ 'darwin' ]]; then
	source "${0:h}/iterm2.zsh"
fi

if [[ "$OSTYPE" =~ 'linux' ]]; then
  source "${0:h}/ubuntu.zsh"
fi

which direnv > /dev/null && eval "$(direnv hook zsh)"

test -f /usr/local/share/chruby/chruby.sh && \
source /usr/local/share/chruby/chruby.sh && \
source /usr/local/share/chruby/auto.sh

# Local NodeJs https://github.com/mklement0/n-install
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH="$N_PREFIX/bin:$PATH"

# add local bin folder to path
PATH=".git/safe/../../bin:node_modules/.bin:$PATH" # mkdir .git/safe
export -U PATH
# faster nokogiri install
export -U NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# desligar autocorrect
unsetopt Correct

source "${0:h}/elapse-timer/stop.zsh"
