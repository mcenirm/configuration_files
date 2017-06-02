test "$TERM_PROGRAM" = Apple_Terminal && printf '\e[8;0;120t' #'\e[9;1t'

__prepend () {
  local mp p
  case "$1" in
    --manpath=/*) mp=${1#%=} ; shift ;;
    --manpath=*) shift ;;
  esac
  case "$1" in
    /*) p=$1 ;;
    *) return 1 ;;
  esac
  [ -d "$p" ] || return 0
  PATH=${p}${PATH+:${PATH}}
  if [ -d "$mp" ] ; then
    MANPATH=${mp}:${MANPATH}
  fi
}

__prepend /usr/local/sbin

__pyenv_cmd=$( command -v pyenv || true )
if [ -n "${__pyenv_cmd}" ] ; then
  export PYENV_ROOT=${__pyenv_cmd%/bin/pyenv}/var/pyenv
  eval "$(pyenv init -)"
  if command -v pyenv-virtualenv-init > /dev/null; then
    export PYENV_VIRTUALENV_DISABLE_PROMPT=1
    eval "$(pyenv virtualenv-init -)"
  fi
fi
unset __pyenv_cmd

__rbenv_cmd=$( command -v rbenv || true )
if [ -n "${__rbenv_cmd}" ] ; then
  export RBENV_ROOT=${__rbenv_cmd%/bin/rbenv}/var/rbenv
  eval "$(rbenv init -)"
fi
unset __rbenv_cmd

export PATH
export MANPATH

export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

case "$-" in
  *i*) test -f ~/.bashrc && source ~/.bashrc ;;
  *) ;;
esac
