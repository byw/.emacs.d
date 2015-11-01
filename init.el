(require 'package)


(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; swap cmd and opt keys
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; MELPA
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; IDO
 (require 'ido)
    (ido-mode t)

;; Move between windows with shift+arrows
(windmove-default-keybindings)

