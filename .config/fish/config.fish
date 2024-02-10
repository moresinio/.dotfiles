if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias tre='trans -brief '
alias N='sudo -E nnn -H'
alias ht='htop'
starship init fish | source


export NNN_PLUG='s:suedit;l:launch;m:nmount;d:xdgdefault;i:!nsxiv "$nnn"*;n:nuke'
export NNN_BMS='d:~/Documents;D:~/Downloads/'
# export NNN_COLORS="2136"
# export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export VISUAL='ewrap'


function mark_prompt_start --on-event fish_prompt
    echo -en "\e]133;A\e\\"
end

# Created by `pipx` on 2024-02-09 08:38:18
set PATH $PATH /home/rengoku/.local/bin
