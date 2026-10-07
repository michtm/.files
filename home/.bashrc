# ~/.bashrc

# Ne rien faire pour un shell non interactif.
[[ $- == *i* ]] || return

BASH_CONFIG_HOME="${BASH_CONFIG_HOME:-${XDG_CONFIG_HOME:-"$HOME/.config"}/bash}"

if [[ -r "$BASH_CONFIG_HOME/bashrc" ]]; then
    source "$BASH_CONFIG_HOME/bashrc"
fi

unset BASH_CONFIG_HOME
