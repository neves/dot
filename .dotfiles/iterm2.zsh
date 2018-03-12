if [[ "$OSTYPE" =~ 'darwin' ]]; then
  test -e     "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh" \
    && source "${ZDOTDIR:-$HOME}/.iterm2_shell_integration.zsh"
fi
