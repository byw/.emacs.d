(require 'package)

(when (display-graphic-p)
  (tool-bar-mode 0))

(global-whitespace-mode t)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; for purescript support
(add-to-list 'package-archives
             '("emacs-pe" . "https://emacs-pe.github.io/packages/"))


(setenv "PATH" (concat (getenv "PATH") ":~/bin"))
(setq exec-path (append exec-path '("~/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))
(setq exec-path (append exec-path '("/usr/local/bin")))

(setenv "PATH" (concat (getenv "PATH") ":/Users/bob/.cabal/bin"))
(setq exec-path (append exec-path '("/Users/bob/.cabal/bin")))



;; flycheck error checking
(global-flycheck-mode)

;; company-mode autocomplete
(add-hook 'elm-mode-hook
          (lambda ()
            (setq company-backends '(company-elm))))

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
(require 'smartparens)
(show-paren-mode t)
(add-hook 'emacs-lisp-mode-hook #'smartparens-strict-mode)
(sp-with-modes sp--lisp-modes
  ;; disable ', it's the quote character!
  (sp-local-pair "'" nil :actions nil)
  ;; also only use the pseudo-quote inside strings where it serve as
  ;; hyperlink.
  (sp-local-pair "`" "'" :when '(sp-in-string-p))
  (sp-local-pair "(" nil
                 :pre-handlers '(live-sp-add-space-before-sexp-insertion)
                 :post-handlers '(live-sp-add-space-after-sexp-insertion)))


;; Clojure
(require 'clojure-mode-extra-font-locking)

(require 'clj-refactor)
(defun my-clojure-mode-hook ()
    (clj-refactor-mode 1)
    (yas-minor-mode 1) ; for adding require/use/import
    (cljr-add-keybindings-with-prefix "C-c C-m"))
(add-hook 'clojure-mode-hook #'my-clojure-mode-hook)

(add-hook 'clojure-mode-hook #'subword-mode) ;; Camel case for java interop
(add-hook 'clojure-mode-hook #'rainbow-delimiters-mode)
(add-hook 'clojure-mode-hook #'smartparens-strict-mode)

(load "~/.emacs.d/smartparens.el")

(setq clojure-defun-style-default-indent t)

;; Parinfer (a smarter paredit mode) UNFINISHED!!!
;(load "~/.emacs.d/parinfer-mode/parinfer-mode.el")
;(add-hook 'clojure-mode-hook #'parinfer-mode)

;; Mark a line
(defun mark-line (&optional arg)
  (interactive "p")
  (if (not mark-active)
      (progn
        (beginning-of-line)
        (push-mark)
        (setq mark-active t)))
  (forward-line arg))


;; Save history
(savehist-mode t)
(setq savehist-file "~/.emacs.d/savehist")


;; Line numbers
(setq linum-format "%4d")
(defun my-linum-mode-hook ()
  (linum-mode t)
  (column-number-mode t))
(add-hook 'find-file-hook 'my-linum-mode-hook)


;; Fill
(defun fill-region-or-paragraph ()
  (interactive)
  (if (region-active-p)
      (fill-region)
      (fill-paragraph)))


;; Some key bindings
(bind-keys
 :map global-map
 ("M-z" . mark-line))

;; Octave mode
(add-to-list 'auto-mode-alist '("\\.m$" . octave-mode))


;; Elm
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-elm))
(add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

(require 'flycheck)
(add-hook 'flycheck-mode-hook 'flycheck-elm-setup)


;; Purescript
(eval-after-load 'flycheck
  '(flycheck-purescript-setup))


;; Coffeescript
;; This gives you a tab of 2 spaces
(custom-set-variables '(coffee-tab-width 2))
(custom-set-variables '(coffee-indent-tabs-mode nil))

;; JavaScript
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)
