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
