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

Le script `install` est volontairement inactif pour le moment.
