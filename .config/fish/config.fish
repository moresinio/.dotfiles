if status is-interactive
    # Commands to run in interactive sessions can go here
end

# translate shell
alias t='trans -brief '
alias т='trans -brief :en '
# taskwarrior
alias taa='task add'
alias tal='task list'
alias tad='task done'

alias du='dua'
alias s='sudo -s'
alias N='sudo -E nnn -H'
alias ht='htop'
alias xr='xbps-query -Rs'
alias xs='xbps-query -s'

starship init fish | source

export NNN_PLUG='s:suedit;l:launch;m:nmount;d:xdgdefault;i:!nsxiv "$nnn"*;n:nuke'
export NNN_BMS='d:~/Documents;D:~/Downloads/'

# export PATH="$PATH:/usr/local/bin"
export PATH="$PATH:/home/rengoku/.cargo/bin"
export PATH="$PATH:/home/rengoku/.local/bin"

function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end
