# Prompt Bash — interface d'inspection.

# Évite la réévaluation des valeurs dynamiques du prompt.
shopt -u promptvars

# Réduit les chemins très longs.
PROMPT_DIRTRIM=3

_dotfiles_prompt_update()
{
    local last_status=$?

    local muted='\[\e[38;2;168;161;150m\]'
    local text='\[\e[38;2;216;211;199m\]'
    local accent='\[\e[38;2;187;169;138m\]'
    local error='\[\e[38;2;201;135;125m\]'
    local reset='\[\e[0m\]'

    local line="${muted}DIR${reset} ${text}\w${reset}"
    local git_state branch dirty

    if git_state=$(GIT_OPTIONAL_LOCKS=0 git status \
        --porcelain=v1 --branch \
        --untracked-files=normal 2>/dev/null); then

        branch=${git_state%%$'\n'*}
        branch=${branch#'## '}

        case $branch in
            'HEAD (no branch)')
                branch="@$(git rev-parse --short HEAD)"
                ;;
            'No commits yet on '*)
                branch=${branch#'No commits yet on '}
                ;;
            'Initial commit on '*)
                branch=${branch#'Initial commit on '}
                ;;
        esac

        branch=${branch%%...*}

        dirty=
        [[ $git_state == *$'\n'* ]] && dirty='*'

        line+="  ${muted}GIT${reset} ${accent}${branch}${dirty}${reset}"
    fi

    if (( last_status != 0 )); then
        line+="  ${muted}EXIT${reset} ${error}${last_status}${reset}"
    fi

    if [[ -n ${SSH_CONNECTION:-} ]]; then
        line+="  ${muted}SSH${reset}"
    fi

    if (( EUID == 0 )); then
        line+="  ${error}ROOT${reset}"
    fi

    PS1="${line}"$'\n'"${accent}❯${reset} "
}

# Préserve une éventuelle commande de prompt existante.
if [[ ${PROMPT_COMMAND:-} != *_dotfiles_prompt_update* ]]; then
    PROMPT_COMMAND="_dotfiles_prompt_update${PROMPT_COMMAND:+;$PROMPT_COMMAND}"
fi
