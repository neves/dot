# medir o tempo para carregar zshrc
if [[ "$OSTYPE" = darwin* ]]; then
  # osx não suporta precisao menor que 1 segundo,
  # instalar gdate usando: brew install coreutils
  # ou retornar com precisão em segundos mesmo
  timestamp() { gdate +%s%3N 2> /dev/null || date +%s }
else
  timestamp() { date +%s%3N }
fi

elapsedtime() {

}

ELAPSE_TIMER_START=$(timestamp)

DOTFILES_ROOT_DIR="${0:h}"

# log time to load each module if active
if zstyle -t ':dotfiles:load' verbose; then
  dotload() {
    local TIME_BEFORE_LOAD=$(timestamp)
    
    . "$DOTFILES_ROOT_DIR/$1.zsh" 2> /dev/null

    local TIME_AFTER_LOAD=$(timestamp)
    local ELAPSED_TIME=$((($TIME_AFTER_LOAD - $TIME_BEFORE_LOAD) / 1000.0))
    local MS=$((($TIME_AFTER_LOAD - $TIME_BEFORE_LOAD)))
    (($MS < 100)) && local C=32 || local C=31
    printf "\e[${C}m%3dms $1\e[0m\n" $MS
  }
else
  dotload() {
    . "$DOTFILES_ROOT_DIR/$1.zsh"
  }
fi
