if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias sshzeus='kitten ssh sgarg21@zeus.vse.gmu.edu'
alias vim=nvim
alias ..='cd ..'
alias cat=bat
alias btui=bluetuith
alias hx=helix
set -g fish_greeting
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/go/bin $PATH
set PRETTIERD_DEFAULT_CONFIG ~/.prettierrc.json
zoxide init fish | source
starship init fish | source

set -x MOZ_ENABLE_WAYLAND 1

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/sgarg26/.ghcup/bin # ghcup-env
