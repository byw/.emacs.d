(require 'package)


;; MELPA
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line


(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

;; swap cmd and opt keys
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)

;; IDO
 (require 'ido)
    (ido-mode t)

;; Move between windows with shift+arrows
(windmove-default-keybindings)

;; Save session before closing
(desktop-save-mode 1)

;; Paren matching
(show-paren-mode t)


;; Clojure
(require 'clojure-mode-extra-font-locking)

(require 'clj-refactor)
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(add-hook 'clojure-mode-hook #'subword-mode) ;; Support camel case for java interop
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)



(load "~/.emacs.d/smartparens.el")
