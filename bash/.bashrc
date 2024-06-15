# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# set tty options
stty -ixon

# set sh options
shopt -s histappend
shopt -s globstar
shopt -s dotglob
shopt -s checkwinsize

# enable UTF-8
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# enable TZ
export TZ='Asia/Shanghai'

# set history options
export HISTCONTROL=ignoreboth
export HISTSIZE=1000
export HISTFILESIZE=2000

# enable git completion options
export GIT_COMPLETION_SHOW_ALL="1"
export GIT_COMPLETION_SHOW_ALL_COMMANDS="1"
export GIT_COMPLETION_CHECKOUT_NO_GUESS="1"

# enable git PS1 options
export GIT_PS1_SHOWDIRTYSTATE="on"
export GIT_PS1_SHOWSTASHSTATE="on"
export GIT_PS1_SHOWUNTRACKEDFILES="on"
export GIT_PS1_SHOWCOLORHINTS="on"
export GIT_PS1_COMPRESSSPARSESTATE="on"
export GIT_PS1_SHOWCONFLICTSTATE="on"
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_DESCRIBE_STYLE="default"

# enable color support
export CLICOLOR=YES
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable git prompt
export PROMPT_COMMAND='__git_ps1 "\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]" "\\\$ "'

# enable color support
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias ls='ls -CF --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# enable lesspipe
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh /usr/bin/lesspipe)"

# enable bash completion
[[ -r "/etc/profile.d/bash_completion.sh" ]] && . "/etc/profile.d/bash_completion.sh"

# enable git completion
[[ -r "/etc/bash_completion.d/git-prompt" ]] && . "/etc/bash_completion.d/git-prompt"
[[ -r "/usr/share/bash-completion/completions/git" ]] && . "/usr/share/bash-completion/completions/git"

# enable tmux
if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]]; then
    exec tmux -u new-session -A -c ~ -s ssh
fi
