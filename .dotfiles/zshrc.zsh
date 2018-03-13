zstyle ':dotfiles:load' verbose 'yes'

source "${0:h}/start.zsh"

dotload 'prezto'
dotload 'git'
dotload 'yadm'
dotload 'heroku'
dotload 'aws'
dotload 'gcloud'
dotload 'functions'
dotload 'direnv'
dotload 'chruby'
dotload 'ni'
dotload 'aliases'
dotload 'paths'
dotload 'iterm2'
dotload 'ubuntu'
dotload 'completion'

source "${0:h}/stop.zsh"
