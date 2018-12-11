(require 'package)

;;==============================
;; Show line number
;;==============================
(global-linum-mode 1) ; always show line numbers                              
(setq linum-format "%d| ")  ;set format

;;==============================
;; Package Source
;;==============================
;; Add more package resources
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))
(add-to-list 'package-archives
  ;; choose either the stable or the latest git version:
  ;; '("melpa-stable" . "http://stable.melpa.org/packages/")
  '("melpa-unstable" . "http://melpa.org/packages/"))
(package-initialize)
;;Set url proxy method
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;	("http" . "127.0.0.1:1080")
;;	("https" . "127.0.0.1:1080")))

;; Add exec path from shell
;; by Purcell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;;==============================
;; Elpy settings
;;==============================
(elpy-enable)
(setq elpy-rpc-python-command "python")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/macdown")
 '(package-selected-packages
   (quote
    (ensime paredit epm geiser julia-mode company-tern xref-js2 js2-refactor js2-mode markdown-mode magit projectile web-mode elpy)))
 '(projectile-mode t nil (projectile))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))


;; ==============================
;; Add web-mode projectile
;;==============================
;; Web-mode options
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)
;; Projectile install
;; Web-mode options                                                                                 
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)

(require 'projectile)
;;C-c p p  ;; switch projects
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
;;C-c p f  ;; list project files
(global-set-key (kbd "C-c p f") 'projectile--find-file)
;;C-c p g  ;; grep project
(global-set-key (kbd "C-c p g") 'projectile-grep)
;; Set projects search path
(setq projectile-project-search-path '("~/Gitlab/" "~/Github/"))

;; ==============================
;; Magit settings for Git
;;==============================

;; Magit status shotcut
(global-set-key (kbd "C-x g") 'magit-status)


;;==============================
;; Jedi: Python autocomplete
;;==============================
;; Jedi for python autocompletion
;; install jedi server to start auto completion
;; M-x jedi:install-server
(setq python-environment-virualenv "/Users/k/anaconda3/bin/virtualenv")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;;==============================
;; Material Theme
;;==============================
(load-theme 'material t)
;;(load-theme 'material-light t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;==============================
;; Markdown and preview settings
;;==============================

;; Add Markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown")
(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode"
   "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;; Add Markdown Preview parser C-c C-c p



;;==============================
;;     JavaScript Env Settings
;;==============================
;; Install JavaScript-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

;; Js2-refactor and xref-js2
(require 'js2-refactor)
(require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
(define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
(define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; Autocomplete
(require 'company)
(require 'company-tern)

(add-to-list 'company-backends 'company-tern)
(add-hook 'js2-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode)))
                           
;; Disable completion keybindings, as we use xref-js2 instead
(define-key tern-mode-keymap (kbd "M-.") nil)
(define-key tern-mode-keymap (kbd "M-,") nil)

;;==============================
;;     Julia Env Settings
;;==============================
;; download julia-mode.el from https://github.com/JuliaEditorSupport/julia-emacs/blob/master/julia-mode.el
;;(add-to-list 'load-path ".emacs.d/julia/julia-mode.el")
;;(require 'julia-mode)


;;==============================
;;     Common Lisp Env Settings
;;==============================
(setq inferior-lisp-program "/usr/local/bin/sbcl")

;;==============================
(add-hook 'yaml-mode-hook
          (lambda ()
            (define-key yaml-mode-map "\C-m" 'newline-and-indent)))



;;==============================
;;     General Emacs Settings
;;==============================

;; 1. Window split redo & undo
;; Package-Install winner-mode
;; Automatically start with winner-mode
;; Winner mode Shortcuts:
;; C-c <- : undo
;; C-c -> : redo
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; 2. Window split move with directions
;; Window move key bindings
(global-set-key (kbd "C-c w <left>")  'windmove-left)
(global-set-key (kbd "C-c w <right>") 'windmove-right)
(global-set-key (kbd "C-c w <up>")    'windmove-up)
(global-set-key (kbd "C-c w <down>")  'windmove-down)

;; 3. Automatically refresh package content
(when (not package-archive-contents)
    (package-refresh-contents))

;;==============================
;;     Scheme Settings
;;==============================
(add-to-list 'load-path "Users/k/.emacs.d/scheme/xscheme.el")

;; Install geiser, company-mode, paredit


;;==============================
;;     Scala Settings
;;==============================


;; 1. Ensime
;;
(add-to-list 'exec-path "/usr/local/bin")

;; 2. Scala-mode
;; https://github.com/ensime/emacs-scala-mode
;;
(use-package scala-mode
  :interpreter
  ("scala" . scala-mode))

;; 3. Sbt-mode
(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))


