source ~/.dotfiles/elapse-timer/start.zsh

source ~/.dotfiles/prezto.zsh
source ~/.dotfiles/asdf.zsh
source ~/.dotfiles/git.zsh
source ~/.dotfiles/aws.zsh
source ~/.dotfiles/yadm.zsh
source ~/.dotfiles/heroku.zsh

if [[ "$OSTYPE" =~ 'darwin' ]]; then
	source ~/.dotfiles/iterm2.zsh
fi

if [[ "$OSTYPE" =~ 'linux' ]]; then
  source ~/.dotfiles/ubuntu.zsh
fi

source ~/.dotfiles/elapse-timer/stop.zsh
