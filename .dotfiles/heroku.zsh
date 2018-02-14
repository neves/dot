# INSTALL
# heroku plugins:install heroku-cli-autocomplete && heroku autocomplete

# lazy load heroku auto completion (@TODO: não carrega no Ubuntu)
_heroku() {
  unset -f _heroku
  source <(heroku autocomplete:script zsh)
  _heroku
}
