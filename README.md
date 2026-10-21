# .files

Dotfiles pour mon environnement de développement sous WSL 2.

## Objectifs

- démarrage du shell rapide et mesurable ;
- configuration modulaire et explicite ;
- déploiement reproductible ;
- dépendances minimales ;
- évolution progressive sans comportement implicite.

## Cible initiale

- WSL 2 ;
- Ubuntu ;
- Bash.

## Organisation

- `home/` : points d'entrée attendus directement dans `$HOME` ;
- `config/` : configuration applicative destinée à `~/.config` ;
- `install` : déploiement des dotfiles.

## Architecture du shell

La configuration vise à conserver un démarrage Bash rapide, explicite et reproductible.

Le démarrage est organisé ainsi :

```text
WSL
└── Bash
    ├── ~/.profile
    │   ├── environnement de session
    │   ├── PATH
    │   ├── pnpm
    │   ├── mise shims
    │   └── SSH_AUTH_SOCK
    │
    └── ~/.bashrc
        └── ~/.config/bash/
            ├── options.bash
            ├── history.bash
            ├── prompt.bash
            ├── aliases.bash
            └── completion.bash
```

Les principes retenus sont :

- les points d'entrée standards restent minimaux ;
- la configuration Bash réelle vit dans `~/.config/bash` ;
- le `PATH` est construit de manière idempotente ;
- `mise` gère les runtimes sans être exécuté au démarrage du shell ;
- les runtimes sont résolus via les shims de `mise` ;
- `ssh-agent` est géré comme un service utilisateur systemd et non par Bash ;
- les données propres à une machine, notamment les identités SSH, ne sont pas versionnées ;
- le déploiement est réalisé par liens symboliques via `install`.

## Performance

Baseline avant restructuration :

```text
bash -i -c exit
moyenne : 838,6 ms
médiane : 854,5 ms
```

Après restructuration :

```text
bash -i -c exit
moyenne : 8,9 ms
médiane : 9 ms
plage   : 8–10 ms
```

Pour un login shell interactif :

```text
bash --login -i -c exit
moyenne : 17 ms
médiane : 17 ms
plage   : 16–21 ms
```

Le coût du démarrage interactif a ainsi diminué d'environ **98,9 %**, soit un facteur d'environ **94×**.

Ces valeurs constituent la baseline de performance de la configuration. Toute évolution affectant le chemin de démarrage du shell doit être comparée à cette référence.


## Terminal interactif

### Environnement

- Windows Terminal avec WSL 2 / Ubuntu.
- Shell : Bash.
- Profil : `wsl.exe -d Ubuntu`.
- Raccourci Windows : `wt.exe -p "Ubuntu"`.

### Identité visuelle

Inspiration : interfaces de NieR:Automata.

- Fond : `#252420` (charbon chaud).
- Texte : `#D8D3C7` (ivoire adouci).
- Texte secondaire : `#A8A196` (gris chaud).
- Accent : `#BBA98A` (sable désaturé).
- Erreur : `#C9877D` (rouge terreux).
- Police : IBM Plex Mono.
- Prompt Bash : deux lignes, informations contextuelles.

### Outils

| Outil | Utilisation |
|---|---|
| fzf | Recherche interactive |
| ripgrep | Recherche dans les fichiers |
| bat | Lecture de fichiers avec coloration syntaxique |

Raccourcis fzf :

- Ctrl+R : historique.
- Ctrl+T : fichiers.
- Alt+C : répertoires.

Installation sous Ubuntu :

```bash
sudo apt install fzf ripgrep bat
```

Sur Ubuntu 24.04, l'exécutable bat est
généralement nommé `batcat`.

### Choix différés

- zoxide : non retenu.
- delta : non retenu à ce stade.
- Thème de coloration syntaxique : à définir
  lors de la configuration de l'éditeur de texte.
- Moteur de fuzzy search personnel : piste future.

### Performance

Baseline historique du démarrage Bash :
environ 9 ms.

Dernière mesure ponctuelle avec fzf :
environ 10 ms.

Recalcul du prompt V1 :
39 ms pour 20 appels, soit 1,95 ms par appel
sur le dépôt testé.

Ces mesures sont indicatives et doivent être
réévaluées après les évolutions significatives.
