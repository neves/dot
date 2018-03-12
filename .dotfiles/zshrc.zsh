source "${0:h}/elapse-timer/start.zsh"

source "${0:h}/prezto.zsh"
# source "${0:h}/asdf.zsh"
source "${0:h}/git.zsh"
source "${0:h}/yadm.zsh"
source "${0:h}/heroku.zsh"
# source "${0:h}/aws.zsh"
source "${0:h}/gcloud.zsh"
source "${0:h}/functions.zsh"
source "${0:h}/aliases.zsh"
source "${0:h}/completion.zsh"
source "${0:h}/paths.zsh"

if [[ "$OSTYPE" =~ 'darwin' ]]; then
	source "${0:h}/iterm2.zsh"
fi

if [[ "$OSTYPE" =~ 'linux' ]]; then
  source "${0:h}/ubuntu.zsh"
fi

which direnv > /dev/null && eval "$(direnv hook zsh)"

source /usr/local/share/chruby/chruby.sh 2> /dev/null
source /usr/local/share/chruby/auto.sh 2> /dev/null

# load avn
# [[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh"

# aws completion
source $(which aws_zsh_completer.sh) 2> /dev/null

# faster nokogiri install
export -U NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# desligar autocorrect
unsetopt Correct

source "${0:h}/elapse-timer/stop.zsh"
