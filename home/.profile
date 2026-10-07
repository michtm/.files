# ~/.profile

# Ajoute un répertoire en tête de PATH uniquement s'il existe
# et n'est pas déjà présent.
path_prepend()
{
    [ -d "$1" ] || return 0

    case ":${PATH:-}:" in
        *":$1:"*) ;;
        *) PATH="$1${PATH:+:$PATH}" ;;
    esac
}

# Répertoires utilisateur.
path_prepend "$HOME/bin"
path_prepend "$HOME/.local/bin"

# pnpm.
PNPM_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}/pnpm"
export PNPM_HOME

path_prepend "$PNPM_HOME/bin"

# mise.
mise_data_dir="${MISE_DATA_DIR:-${XDG_DATA_HOME:-"$HOME/.local/share"}/mise}"
mise_shims_dir="${MISE_SHIMS_DIR:-"$mise_data_dir/shims"}"

path_prepend "$mise_shims_dir"

unset mise_data_dir mise_shims_dir

export PATH

unset -f path_prepend

# Charge la configuration interactive Bash pour un login shell Bash.
if [ -n "${BASH_VERSION:-}" ]; then
    case $- in
        *i*)
            if [ -r "$HOME/.bashrc" ]; then
                . "$HOME/.bashrc"
            fi
            ;;
    esac
fi
