alias dcbuild="docker-compose build"
alias dcup="docker-compose up"
alias dcdown="docker-compose down"
alias dockps="docker ps --format '{{.ID}} {{.Names}}'"
alias sshzeus='kitten ssh sgarg21@zeus.vse.gmu.edu'
alias vim=nvim
alias ..='cd ..'
alias cat=bat
alias btui=bluetuith
alias hx=helix
function docksh
    docker exec -it $argv /bin/bash
end
