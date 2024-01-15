# .bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


export NNN_BMS='d:~/Documents;D:~/Downloads/'
export NNN_COLORS="2136"
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_ARCHIVE="\\.(7z|a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rar|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)$"
export VISUAL=ewrap
export NNN_PLUG='s:suedit'


