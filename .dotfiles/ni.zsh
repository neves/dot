# node install[er]
# ni 8.9.4
ni() {
  NI="$HOME/ni"
  TMP=/tmp

  if [[ $# -eq 0 ]]; then
    VERSIONS="$TMP/node-versions.json"
    [[ -f "$VERSIONS" ]] || wget https://nodejs.org/dist/index.json -O "$VERSIONS"
    cat "$VERSIONS" | grep -o -E 'v([6-9]|1\d)\.\w+\.\w+' | sort -V
    ls -1 "$NI"
    return
  fi

  # cat index.json  | grep -o -E 'v\[6-9]+\.\d+\.\d+' | sort -V
  V="$1"
  T="$NI/$V"

  if [[ ! -d "$T" ]]; then
    [[ $(uname -s) == 'Darwin' ]] && P=darwin || P=linux
    U="https://nodejs.org/dist/v$V"
    N="node-v$V-$P-x64.tar.xz"
    D="$TMP/$N"
    [[ -e "$D" ]] || wget -O "$D" -c "$U/$N"
    mkdir -p "$T"
    echo EXTRACTING "$D" to "$T" ...
    if [[ $(which pv) ]]; then
      tar xvf "$D" -C "$T" --strip-components=1 2>&1 | \
        pv -l -p -i 0.1 -N extracting -c > /dev/null
    else
      tar xvf "$D" -C "$T" --strip-components=1 2> /dev/null
    fi
  fi
}
