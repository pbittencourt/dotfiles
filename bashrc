# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# por enquanto, mantenhamos o que a gente já conhece ...
set -o emacs
# no futuro, viw 4the win
# set -o vim
# bind -m vi-command 'Control-l: clear-screen'
# bind -m vi-insert 'Control-l: clear-screen'

# {{{ SOURCES -----------------------------------------------------------------

# aliases and functions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# git prompt
if [ -f ~/.git-prompt.sh ]; then
    source ~/.git-prompt.sh
fi

# }}} -------------------------------------------------------------------------

# {{{ PROMPT ------------------------------------------------------------------

# colored prompt
force_color_prompt=yes

# define colors
blk='\[\033[01;30m\]'   # Black
red='\[\033[01;31m\]'   # Red
grn='\[\033[01;32m\]'   # Green
ylw='\[\033[01;33m\]'   # Yellow
blu='\[\033[01;34m\]'   # Blue
mgn='\[\033[01;35m\]'   # Magenta
cyn='\[\033[01;36m\]'   # Cyan
wht='\[\033[01;37m\]'   # White
clr='\[\033[00m\]'      # Reset

# When set GIT_PS1_SHOWDIRTYSTATE to a nonempty value, unstaged (*) and
# staged (+) changes will be shown next to the branch name
GIT_PS1_SHOWDIRTYSTATE=""

# You can also see if currently something is stashed, by setting
# GIT_PS1_SHOWSTASHSTATE to a nonempty value. If something is stashed,
# then a '$' will be shown next to the branch name.
GIT_PS1_SHOWSTASHSTATE=""

# If you would like to see if there're untracked files, then you can set
# GIT_PS1_SHOWUNTRACKEDFILES to a nonempty value. If there're untracked
# files, then a '%' will be shown next to the branch name.
GIT_PS1_SHOWUNTRACKEDFILES=""


# If you would like to see the difference between HEAD and its upstream,
# set GIT_PS1_SHOWUPSTREAM="auto".  A "<" indicates you are behind, ">"
# indicates you are ahead, "<>" indicates you have diverged and "="
# indicates that there is no difference.
GIT_PS1_SHOWUPSTREAM=""

gitbr() {
  __git_ps1 " %s "
  #git branch 2>/dev/null | grep '^*' | colrm 1 2
}
#PS1='\n'${blu}'  \t '${cyn}'  \# / \!\n'${mgn}'\w '${cyn}'$(gitbr)'${mgn}'\$\n⤷'${clr}' '
PS1=${mgn}'  \w '${cyn}'$(gitbr)'${mgn}'\n└─ '${clr}

# }}} -------------------------------------------------------------------------

# {{{ PATH --------------------------------------------------------------------

# local bin
export PATH="$PATH:$HOME/.local/bin"

# }}} -------------------------------------------------------------------------

# {{{ HISTORY -----------------------------------------------------------------

# ignore duplicated commands in history
HISTCONTROL=ignoreboth

# number of lines in active history
HISTSIZE=5000

# number of lines in saved bash history
HISTFILESIZE=

# }}} -------------------------------------------------------------------------

# vim:fileencoding=utf-8:foldmethod=marker
