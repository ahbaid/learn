# PS1 prompt - "ahbaidg@safa:~/.ssh[4]$ "
# \u - user
# \w - working dir
# \h - host
# \! - history number

# Save current PS1
export OPS1=$PS1

# ubuntu
export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[02;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\!]\$ "

# Non-ubuntu
export PS1="\[\e]0;\u@\h: \w\a\]\[\033[02;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\][\!]$ "
