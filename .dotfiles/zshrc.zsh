# zstyle ':dotfiles:load' verbose 'yes'

source "${0:h}/start.zsh"

dotload 'prezto'
dotload 'git'
dotload 'yadm'
dotload 'gcloud'
dotload 'functions'
dotload 'direnv'
dotload 'chruby'
dotload 'chnode'
dotload 'chnode-auto'
dotload 'ni'
dotload 'aliases'
dotload 'paths'
dotload 'iterm2'
dotload 'ubuntu'
dotload 'heroku'
dotload 'completion'
dotload 'aws' # precisa vir depois de completion

source "${0:h}/stop.zsh"
