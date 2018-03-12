# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
# search path for functions
alias fpaths='echo $FPATH | tr -s ":" "\n"'
# alias fsize="stat -f %z" # não funciona no Ubuntu
# alias fsize="stat --printf=%s" # não quebra linha
alias fsize="stat -c%s"
# external ip address
alias ip-remote="dig +short myip.opendns.com @resolver1.opendns.com"
# remove all node_modules under current dir recursively
alias rm-node_modules="find . -name 'node_modules' -print -type d -prune -exec rm -rf '{}' +"
# easy parent directory navigation
alias ...="cd ../.."
alias ....="cd ../../.."
# sort by name
alias ls="LANG=C $aliases[ls]"
alias gem-uninstall-all="gem uninstall -aIx"
# list glogal npm packages
alias npm-list-global="npm list -g --depth=0"
# readlink do mac não suporta -f, precisa instalar brew install coreutils
which greadlink > /dev/null && alias readlink=greadlink
# show the link of a bin
lw() {
  where="$(which $1)"
  link=$(readlink -f "$where")
  echo $where
  [ "$where" != "$link" ] && echo $(readlink "$where") && echo $link
}
