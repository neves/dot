FUNCTIONS_DIR="${0:h}/functions"
# adiciona o diretório de funções no path
fpath=($FUNCTIONS_DIR $fpath)
# sinaliza cada função no diretório para ser carregada apenas quando utilizar
for f ($FUNCTIONS_DIR/*) autoload -Uz ${f##*/}
