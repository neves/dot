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
alias gm='git merge --no-edit'

# git status for project directory tree
function gst() {
  # cd "$( dirname "${BASH_SOURCE[0]}" )"
  # DB=$HOME/Dropbox/git
  # mkdir -p $DB
  # rm -f $DB/??-??-??_??-??.txt
  # touch $DB/$(date +"%d-%m-%y_%H-%M.txt")
  # cp "${BASH_SOURCE[0]}" $DB/
  # cp *.rb $DB/
  cd $PWD
  ROOT=$PWD
  for folder in */*/; do
    if [ -f "$folder/.git/config" ]
    then
      color=32
      printf "\e[${color}m$folder\e[0m\n"
      cd $folder
      # git remote -v | cut -f 1 -d ' ' | uniq
      git status -s | sed 's/^/  /' | head -n 5
      git status | grep ahead
      # mkdir -p $DB/$folder/.git
      # cp .git/config $DB/$folder/.git/
      cd $ROOT
    else
      color=31
      printf "\e[${color}m$folder\e[0m\n"
    fi
  done
}
