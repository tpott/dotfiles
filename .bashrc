# ~/.bashrc

# Enable vi mode
set -o vi

# Source secrets file
[ -f ~/.bash_secrets ] && . ~/.bash_secrets

# Enable color support for ls and other commands on Ubuntu
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Enable timestamp in history
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S "

# Bash prompt - converted from zsh format
# \h = hostname, \W = basename of current directory
GREEN="\[\033[0;32m\]"
BLUE="\[\033[0;34m\]"
RESET="\[\033[0m\]"
export PS1="[${GREEN}\h${RESET} ${BLUE}\W${RESET}]\$ "

# Aliases
alias c='sort | uniq -c | sort -nr'
alias osurandom256='python3 -c "print(open(\"/dev/urandom\", \"rb\").read(32).hex())"'

# Functions
function calc {
	python3 -c "import base64, math, random; from datetime import datetime, timedelta; print($1)"
}

function shufn {
	python3 -c "import random, sys; print(''.join(random.choices(sys.stdin.readlines(), k=$1)))"
}

function transpose {
	python3 -c 'import sys; rows = [line.rstrip("\n").split("\t") for line in sys.stdin]; nrows = len(rows); assert nrows > 0, "Expected at least one input row"; ncols = len(rows[0]); cols = [[rows[i][j] for i in range(nrows)] for j in range(ncols)]; print("\n".join(["\t".join(col) for col in cols]))'
}

function ut {
	# email.utils.formatdate() is also useful, and follows RFC2822
	python3 -c "import time; print(time.strftime('%Y-%m-%d %a %H:%M:%S %z (%s)', time.localtime($1)))"
}

function charcount {
	python3 -c 'import sys; in_str = "".join(list(sys.stdin)); print(len(in_str))'
}

# Ctrl+R is enabled by default in bash for reverse search

# Enable comments in interactive shells (bash equivalent)
shopt -s interactive_comments

# NVM setup (works the same in bash)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Increase history size
HISTSIZE=10000
HISTFILESIZE=20000

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Check window size after each command
shopt -s checkwinsize
