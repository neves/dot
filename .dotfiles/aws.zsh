if which aws > /dev/null; then
  ASDF_PYTHON=$(asdf which python 2> /dev/null)
  #  python foi instalado utilizando asdf
  if [ "$ASDF_PYTHON" ]; then
    source "$(dirname $ASDF_PYTHON)/aws_zsh_completer.sh"
  else
    # Não consegue carregar se (which aws_zsh_completer.sh) for um shim
    source "${ZDOTDIR:-$HOME}/.oh-my-zsh/plugins/aws/aws.plugin.zsh"
  fi
fi
