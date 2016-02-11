#!/bin/bash

prefix() {
    export pre="${@}"
    export PS1="$(echo '${pre}')> "

    [[ -f $PREFIX_HOME/lib/bash-preexec/bash-preexec.sh ]] && source $PREFIX_HOME/lib/bash-preexec/bash-preexec.sh
    preexec() { ${pre} $1; kill -INT $$; };
    export -f preexec
}

export -f prefix
