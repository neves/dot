alias y="yadm"
alias ys="yadm status -s"
alias yt="yadm status -s"
# show untracked files
alias ysu="yadm status -s -u"
alias yp="yadm push"
alias yu="yadm pull --rebase --autostash"
alias yd="yadm icdiff"
alias ydc="yadm icdiff --cached"
# Listar todos os arquivos adicionados no git
alias yl="yadm ls-files"
# commit com os arquivos modificados como mensagem
alias yadm_status_for_commit_message='yadm diff --cached --name-status | tr -s "\n " "  " | awk ''{$1=$1};1'''
alias yacp="ya && yc && yp"
yc() {
	if [[ $# -gt 0 ]]; then
    yadm commit -m "$*"
  else
    yadm commit -m "$(yadm_status_for_commit_message)"
  fi
}

# add only changed files, or parameters
ya() {
  if [[ $# -gt 0 ]]; then
    yadm add -f "$@"
  else
    yadm add -u
  fi
  yadm status -s
}

# add file for current platform
yap() {
  target="$1##$(uname -s)"
  mv "$1" "$target"
  ya "$target"
  yc
}
