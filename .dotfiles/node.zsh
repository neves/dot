# load avn if exists: Automatic Version Switching for Node
# https://github.com/wbyoung/avn
test -e "${ZDOTDIR:-$HOME}/.avn/bin/avn.sh" && \
 source "${ZDOTDIR:-$HOME}/.avn/bin/avn.sh"
