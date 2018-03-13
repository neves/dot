# exibir o tempo levado para carregar o .zshrc em segundos
ELAPSE_TIMER_STOP=$(timestamp)
printf "%.1fs\n" $((($ELAPSE_TIMER_STOP - $ELAPSE_TIMER_START) / 1000.0))
unset ELAPSE_TIMER_START ELAPSE_TIMER_STOP DOTFILES_ROOT_DIR
unset -f timestamp dotload
