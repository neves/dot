zstyle ':dotfiles:load' verbose 'yes'

source "${0:h}/start.zsh"

dotload prezto
dotload git
dotload yadm
dotload heroku
dotload aws
dotload gcloud
dotload functions
dotload aliases
dotload paths
dotload completion
dotload direnv
dotload ruby
dotload node
dotload iterm2
dotload ubuntu

# faster nokogiri install
export -U NOKOGIRI_USE_SYSTEM_LIBRARIES=true

# desligar autocorrect
unsetopt Correct

source "${0:h}/stop.zsh"
