PS1="\\h:\\W \\u \${?#0}\\\$ "
test -z "${BASH_COMPLETION:-}" -a -f /usr/local/etc/bash_completion && . /usr/local/etc/bash_completion
