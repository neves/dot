# INSTALL
# heroku plugins:install heroku-cli-autocomplete && heroku autocomplete

# lazy load heroku auto completion
if [[ "$OSTYPE" =~ 'darwin' ]]; then
  _heroku() {
    unset -f _heroku
    source <(heroku autocomplete:script zsh)
    _heroku
  }
else # ubuntu carrega autocomplete após primeiro comando
  # TODO carregar na primeira vez que tentar completar (igual Mac acima)
  heroku() {
    unset -f heroku
    source <(heroku autocomplete:script zsh)
    heroku $@
  }
fi
