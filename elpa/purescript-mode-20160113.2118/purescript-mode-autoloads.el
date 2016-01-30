;;; purescript-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (or (file-name-directory #$) (car load-path)))

;;;### (autoloads nil "purescript-font-lock" "purescript-font-lock.el"
;;;;;;  (22188 22865 0 0))
;;; Generated autoloads from purescript-font-lock.el

(defface purescript-keyword-face '((t :inherit font-lock-keyword-face)) "\
Face used to highlight PureScript keywords." :group (quote purescript))

(defface purescript-constructor-face '((t :inherit font-lock-type-face)) "\
Face used to highlight PureScript constructors." :group (quote purescript))

(defface purescript-operator-face '((t :inherit font-lock-variable-name-face)) "\
Face used to highlight PureScript operators." :group (quote purescript))

(defface purescript-pragma-face '((t :inherit font-lock-preprocessor-face)) "\
Face used to highlight PureScript pragmas." :group (quote purescript))

(defface purescript-literate-comment-face '((t :inherit font-lock-doc-face)) "\
Face with which to fontify literate comments.
Inherit from `default' to avoid fontification of them." :group (quote purescript))

(autoload 'purescript-font-lock-choose-keywords "purescript-font-lock" "\


\(fn)" nil nil)

;;;***

;;;### (autoloads nil "purescript-mode" "purescript-mode.el" (22188
;;;;;;  22865 0 0))
;;; Generated autoloads from purescript-mode.el

(defvar purescript-mode-compilation-regex-alist-alist `((psc ,(rx line-start (* space) (32 "Error ") "at " (group (minimal-match (one-or-more not-newline))) " line " (group (+ num)) ", column " (group (+ num)) " - line " (group (+ num)) ", column " (group (+ num)) (32 ":")) 1 (2 . 3) (4 . 5) (6))) "\
Alist for PureScript errors.  See: `compilation-error-regexp-alist'.")

(defvar purescript-mode-compilation-regex-alist (mapcar 'cdr purescript-mode-compilation-regex-alist-alist) "\
PureScript `compilation-error-regexp-alist'.")

(eval-after-load 'compile '(dolist (alist purescript-mode-compilation-regex-alist-alist) (add-to-list 'compilation-error-regexp-alist (car alist)) (add-to-list 'compilation-error-regexp-alist-alist alist)))

(autoload 'purescript-mode "purescript-mode" "\
Major mode for PureScript.

\\<purescript-mode-map>

\(fn)" t nil)

(defvar purescript-pursuit-url "http://pursuit.purescript.org/search?q=%s" "\
Default value for pursuit website.")

(custom-autoload 'purescript-pursuit-url "purescript-mode" t)

(defalias 'pursuit #'purescript-pursuit)

(autoload 'purescript-pursuit "purescript-mode" "\
Do a pursuit search for QUERY.

\(fn QUERY)" t nil)

(add-to-list 'auto-mode-alist '("\\.purs\\'" . purescript-mode))

;;;***

;;;### (autoloads nil nil ("purescript-mode-pkg.el") (22188 22865
;;;;;;  251279 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; purescript-mode-autoloads.el ends here
