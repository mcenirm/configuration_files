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

export PATH
export MANPATH

export GREP_OPTIONS='--color=auto'
export CLICOLOR=1

test -f ~/.bashrc && source ~/.bashrc
