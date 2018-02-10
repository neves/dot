# No arguments: `git status -s`
# With arguments: acts like `git`
unalias g &> /dev/null
g() {
  if [[ $# -gt 0 ]]; then
    git "$@"
  else
    git status
  fi
}

unalias gc &> /dev/null
gc() { noglob git commit -m "$*" && git status -s }

unalias ga &> /dev/null
ga() { git add -A $* && git status }

alias gt='git status -s'
alias gp='git push -v --progress --follow-tags'
# push new branch to remote
alias gpb='git push --set-upstream origin "$(git symbolic-ref --short HEAD)"'
alias gu='git pull --rebase --autostash'
alias gd='git icdiff'
# diff files already staged
alias gdc='gd --cached'
# diff from last commit
alias gdl='gd HEAD~'
# create new branch
alias gbc='git checkout -b'
alias gcm='git checkout master'
alias gco='git checkout'
alias gb='git branch'
alias gbd='git branch --delete'
alias gm='git merge'
