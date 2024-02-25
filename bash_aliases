# {{{ ALIASES ----------------------------------------------------------------

alias ..='cd ..'
alias grep='grep --color=auto'
alias ls='ls --color=auto --group-directories-first'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ncmpcpp='ncmpcpp --quiet'
alias tsd='transmission-daemon'
alias tsr='transmission-remote'

# }}} ------------------------------------------------------------------------

# {{{ FUNCTIONS --------------------------------------------------------------

# combine 'mkdir' and 'cd'
mkcd ()
{
    mkdir -p -- "$1" &&
      cd -P -- "$1"
}

# combine 'cd' and 'ls'
cdls ()
{
    cd "$1" &&
    ls
}

# change to directory and
# open vim
cdvim ()
{
    cd "$1" &&
    vim
}

# touch, chmod and edit!
tce ()
{
    touch "$1" &&
    chmod +x "$1" &&
    vim "$1"
}

# shortening git commands
gits ()
{
    git status
}
gita () {
    git add .
}
gitc () {
    git commit -m "$1"
}

# git 'full': show status, add everything
# to stage, commit with 'message', push to
# remote address and show status, again!
gitf () {
    git status &&
    git add . &&
    git commit -m "$1" &&
    git push &&
    git status
}

# xbps
xq () {
    xbps-query -Rs "$1"
}
xi () {
    sudo xbps-install -Sv "$1"
}

# }}} ------------------------------------------------------------------------

# vim:fileencoding=utf-8:foldmethod=marker
