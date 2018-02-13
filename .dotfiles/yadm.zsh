alias y="yadm"
alias ys="yadm status -s"
alias yp="yadm push"
alias yu="yadm pull --rebase --autostash"
# commit com os arquivos modificados como mensagem
alias yc='yadm commit -m "$(yadm status -s)"'
# Listar todos os arquivos adicionados no git
alias yl="yadm ls-files"

# add only changed files, or parameters
ya() {
  if [[ $# -gt 0 ]]; then
    yadm add "$@"
  else
    yadm add -u
  fi
  yadm status -s
}
