if [ -d "${ZDOTDIR:-$HOME}/.oh-my-zsh" ]; then
  source ~/.oh-my-zsh/plugins/asdf/asdf.plugin.zsh
  # reshim all asdf plugins
  alias reshim="asdf plugin-list | xargs -Iplugin sh -c 'echo reshim plugin && asdf reshim plugin'"
fi
