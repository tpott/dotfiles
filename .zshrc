# ~/.zshrc

set -o vi

. ~/.zsh_secrets

export CLICOLOR=1

export HISTTIMEFORMAT="%F %T"

export PATH=$PATH:~/Library/Python/3.7/bin

# From https://developer.android.com/tools/variables
export ANDROID_HOME=~/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$ANDROID_HOME/cmdline-tools/latest/bin

# Just trying to get `npx react-native doctor` happy with JDK
export PATH=$PATH:/usr/local/Cellar/openjdk@17/17.0.14/bin
export JAVA_HOME=/usr/local/Cellar/openjdk@17/17.0.14

# BLUE="\[\033[0;34m\]"
# GREEN="\[\033[0;32m\]"
# END="\[\033[0m\]"
# export PS1="[$GREEN\h$END $BLUE\W$END]\$ "
export PS1="[%F{green}%m%f %F{blue}%1d%f]$ "

alias c='sort | uniq -c | sort -nr'
alias osurandom256='python3 -c "print(open(\"/dev/urandom\", \"rb\").read(32).hex())"'

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

# https://stackoverflow.com/questions/14040351/filtering-zsh-history-by-command
bindkey "^R" history-incremental-search-backward

# https://stackoverflow.com/questions/11670935/comments-in-command-line-zsh
setopt interactivecomments
