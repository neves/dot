# Add Snap bin to path
export PATH="/snap/bin:$PATH"
alias open="xdg-open"
# corrige problema de ao criar um novo terminal, não lembrar da pasta onde estava
# https://github.com/gnunn1/tilix/wiki/VTE-Configuration-Issue
source /etc/profile.d/vte*.sh
