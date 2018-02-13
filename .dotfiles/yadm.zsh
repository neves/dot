alias y="yadm"
alias ys="yadm status -s"
alias yp="yadm push"
alias yu="yadm pull --rebase --autostash"
# Listar todos os arquivos adicionados no git
alias yl="yadm ls-files"
# commit com os arquivos modificados como mensagem
alias yadm_status_for_commit_message='yadm status -s | tr -s "\n " "  " | awk ''{$1=$1};1'''
alias yc='yadm commit -m "$(yadm_status_for_commit_message)"'
# add only changed files, or parameters
ya() {
  if [[ $# -gt 0 ]]; then
    yadm add "$@"
  else
    yadm add -u
  fi
  yadm status -s
}
