source ~/.dotfiles/zshrc.zsh

# test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
# [[ -f /Users/neves/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/neves/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
# [[ -f /Users/neves/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/neves/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
