
# Recherche interactive avec fzf.

# L'intégration reste facultative si fzf n'est pas installé.
if command -v fzf >/dev/null 2>&1; then

    # Interface assortie au thème du terminal.
    export FZF_DEFAULT_OPTS="
        --height=40%
        --layout=reverse
        --border=none
        --prompt='FIND > '
        --pointer='❯'
        --color=fg:#D8D3C7,bg:#252420
        --color=fg+:#D8D3C7,bg+:#39372F
        --color=hl:#BBA98A,hl+:#BBA98A
        --color=info:#A8A196,header:#A8A196
        --color=prompt:#BBA98A,pointer:#BBA98A
        --color=marker:#BBA98A,spinner:#BBA98A
    "

    # Raccourcis : Ctrl-R, Ctrl-T et Alt-C.
    if [[ -r /usr/share/doc/fzf/examples/key-bindings.bash ]]; then
        source /usr/share/doc/fzf/examples/key-bindings.bash
    fi
fi
