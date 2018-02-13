# lazy load heroku auto completion
_heroku() {
  unset -f _heroku
  source <(heroku autocomplete:script zsh)
  _heroku
}
