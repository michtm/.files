;;; early-init.el --- Pré-initialisation Emacs  -*- lexical-binding: t; -*-

;; Copyright (C) 2025 michtm

;; Author: michtm <michel.tring@gmail.com>
;; Created: 2025-01-14

;;; Commentary:

;; Prépare d'une certaine manière le chargement de init.el. D'après la fonction
;; `command-line', il se passe les choses suivantes entre le chargement de
;; "early-init" et de "init" (de façon très résumée):
;; 1. Initialisation du système de paquets (appel de `package-activate-all')
;; 2. Inialisation du système de fenêtrage (appel de `window-system-initialization')
;; 3. Exécution de `before-init-hook'
;; 4. Création d'un cadre initial (appel de `frame-initialize')
;; 5. Chargement de "site-start"

;; Le code qui suit est organisé comme suit:
;; - Définition de symboles
;: - Exécution

;;; Code:

;; Définition de symboles
(defun mdf--before-init ()
  "Fonction prévue pour `before-init-hook'"
  ;; Les barres sont masquées pour chaque cadre
  (setq menu-bar-mode nil
	tab-bar-mode nil
	tool-bar-mode nil)
  ;; Modifier le cadre initial pour le rendre invisible lors du chargement de
  ;; "init"
  (add-to-list 'initial-frame-alist '(visibilty . nil)))

(defun mdf--after-init ()
  "Fonction prévue pour `after-init-hook'"
  ;; Rendre visible le cadre initial
  (unless (frame-visible-p frame-initial-frame)
    (make-frame-visible frame-initial-frame)))

(defun mdf--emacs-startup ()
  "Fonction prévue pour `emacs-startup-hook'"
  ;; Seuil du ramasse-miette à la normale
  (setq gc-cons-threshold 800000
	gc-cons-percentage 0.1))

(defun mdf--run-early-init ()
  "Exécution de early-init"
  ;; Augmente temporairement le seuil du ramasse-miette
  (setq gc-cons-threshold most-positive-fixnum
	gc-cons-percentage 0.5)
  ;; On s'assure que les paquets soient activés au démarrage
  (setq package-enable-at-startup t)
  ;; Ajout de fonctions dans les listes de crochets
  (add-hook 'before-init-hook 'mdf--before-init)
  (add-hook 'after-init-hook 'mdf--after-init)
  (add-hook 'emacs-startup-hook 'mdf--emacs-startup))

;; Exécution
(mdf--run-early-init)

;;; early-init.el ends here
