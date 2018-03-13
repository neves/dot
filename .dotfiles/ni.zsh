# node install[er]
ni() {
  [[ $# -gt 0 ]] || return
  # cat index.json  | grep -o -E 'v\[6-9]+\.\d+\.\d+' | sort -V
  V="$1"
  NI="$HOME/ni"
  T="$NI/$V"

  if [[ ! -d "$T" ]]; then
    [[ $(uname -s) == 'Darwin' ]] && P=darwin || P=linux
    U="https://nodejs.org/dist/v$V"
    N="node-v$V-$P-x64.tar.xz"
    TMP=/tmp
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

  (
    cd "$NI"
    \ln -fsn "$V" node
  )

  # REPLACE $PATH
  # NODE=$(which node > /dev/null)
  # BIN="$T/bin"
  # if [[ -x "$NODE" ]]; then
  #   NODE_DIR="${NODE:h}"
  #   PATH="${PATH/$NODE_DIR/$BIN}"
  # else
  #   PATH="$BIN:$PATH"
  # fi
  # export -U PATH

  # which node
  echo "\e[32mni using node \e[36m$V\e[0m"
}

unset NODE_AUTO_VERSION

# não faz switch ao entrar na pasta, apenas antes de algum comando dentro da pasta
function ni_auto() {
	local dir="$PWD/" version

	until [[ -z "$dir" ]]; do
		dir="${dir%/*}"

		if { read -r version <"$dir/.node-version"; } 2>/dev/null || [[ -n "$version" ]]; then
			version="${version%%[[:space:]]}"

			if [[ "$version" == "$NODE_AUTO_VERSION" ]]; then return
			else
				NODE_AUTO_VERSION="$version"
				ni "$version"
				return $?
			fi
		fi
	done
}

if [[ -n "$ZSH_VERSION" ]]; then
	if [[ ! "$preexec_functions" == *ni_auto* ]]; then
		preexec_functions+=("ni_auto")
	fi
elif [[ -n "$BASH_VERSION" ]]; then
	trap '[[ "$BASH_COMMAND" != "$PROMPT_COMMAND" ]] && ni_auto' DEBUG
fi
