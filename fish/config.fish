if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -g fish_greeting
set -Ux EDITOR nvim
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/go/bin $PATH
set PRETTIERD_DEFAULT_CONFIG ~/.prettierrc.json
zoxide init fish | source
starship init fish | source
~/.local/bin/mise activate fish | source

set -x MOZ_ENABLE_WAYLAND 1
