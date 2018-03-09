# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
alias fpaths='echo $FPATH | tr -s ":" "\n"'
alias fsize="stat -f %z"
alias ip-remote="dig +short myip.opendns.com @resolver1.opendns.com"
alias rm-node_modules="find . -name 'node_modules' -print -type d -prune -exec rm -rf '{}' +"
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="LANG=C $aliases[ls]"
