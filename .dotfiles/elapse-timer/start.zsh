# medir o tempo para carregar zshrc
if [[ "$OSTYPE" = darwin* ]]; then
  # osx não suporta precisao maior que 1 segundo,
  # instalar gdate usando: brew install coreutils
  # ou retornar com precisão em segundos mesmo
  function timestamp() { gdate +%s%3N 2> /dev/null || date +%s }
else
  function timestamp() { date +%s%3N }
fi

ELAPSE_TIMER_START=$(timestamp)
