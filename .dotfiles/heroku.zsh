# INSTALL
# heroku plugins:install heroku-cli-autocomplete && heroku autocomplete

# lazy load heroku auto completion
if [[ "$OSTYPE" =~ 'darwin' ]]; then
  _heroku() {
    unset -f _heroku
    source <(heroku autocomplete:script zsh)
    _heroku
  }
else # ubuntu

fi
