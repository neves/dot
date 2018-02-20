bkp() {
  if [ $# -lt 1 ]; then
    echo "Usage: bkp path/to/file.ext\trenames to file.ext.bkp"
    return 1
  else
    mv "$1" "$1.bkp"
  fi
}
