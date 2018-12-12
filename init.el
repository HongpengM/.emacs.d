;;==============================
;;     General Emacs Settings
;;==============================


(require 'package)

;;-------------------------------
;; Show line number
(global-linum-mode 1)			; always show line numbers
(setq linum-format "%d| ")		;set format

;;-------------------------------
;; Insert today's date
(defun insert-current-date () 
  (interactive) 
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;; Interactive-do-mode on
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

;;-------------------------------
;; Package Source
;; Add more package resources
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/") 
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

;;------------------------------
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
;; Frame move binds with wind move
;; Add framemove to load path
(add-to-list 'load-path "~/.emacs.d/package_manual")

;; 3. Automatically refresh package content
(when (not package-archive-contents) 
  (package-refresh-contents))

;;------------------------------
;; Material Theme
(load-theme 'material t)
;;(load-theme 'material-light t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;------------------------------
;; Projectile settings
(require 'projectile)
;;C-c p p  ;; switch projects
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
;;C-c p f  ;; list project files
(global-set-key (kbd "C-c p f") 'projectile--find-file)
;;C-c p g  ;; grep project
(global-set-key (kbd "C-c p g") 'projectile-grep)
;; Set projects search path
(setq projectile-project-search-path '("~/Gitlab/" "~/Github/"))

;; ------------------------------
;; Magit settings for Git
;; Magit status shotcut
(global-set-key (kbd "C-x g") 'magit-status)


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
 '(package-selected-packages (quote (nvm js-comint dockerfile-mode ensime paredit epm geiser
					 julia-mode company-tern xref-js2 js2-refactor js2-mode
					 markdown-mode magit projectile web-mode elpy))) 
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
;; Markdown and preview settings
;;==============================

;; Add Markdown mode
(add-to-list 'load-path "~/.emacs.d/markdown")
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "markdown-mode" "Major mode for editing GitHub Flavored Markdown files" t)
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

;; JS run env
;; js-comint  js REPL in emacs
(require 'js-comint)
;; default using node.js
(setq js-comint-program-command "node")
(setq js-comint-program-arguments '("--interactive"))
;; Clean output when using node.js
(defun inferior-js-mode-hook-setup () 
  (add-hook 'comint-output-filter-functions 'js-comint-process-output))
(add-hook 'inferior-js-mode-hook 'inferior-js-mode-hook-setup t)
;; Shortcut settings
(add-hook 'js2-mode-hook (lambda () 
			   (local-set-key (kbd "C-x C-e") 'js-send-last-sexp) 
			   (local-set-key (kbd "C-c b") 'js-send-buffer) 
			   (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go)))



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
(add-hook 'yaml-mode-hook (lambda () 
			    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))





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
(use-package 
  scala-mode 
  :interpreter ("scala" . scala-mode))

;; 3. Sbt-mode
(use-package 
  sbt-mode 
  :commands sbt-start 
  sbt-command 
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition 'minibuffer-complete-word 'self-insert-command
			     minibuffer-local-completion-map))


;;==============================
;;     C++ & C Settings
;;==============================

;; On air grammar check
(use-package 
  flycheck 
  :ensure t 
  :init (global-flycheck-mode))

;; Irony
;; Ref:  http://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html
(require 'req-package)
(req-package 
  irony 
  :config (progn
	    ;; If irony server was never installed, install it.
	    (unless (irony--find-server-executable) 
	      (call-interactively #'irony-install-server)) 
	    (add-hook 'c++-mode-hook 'irony-mode) 
	    (add-hook 'c-mode-hook 'irony-mode)

	    ;; Use compilation database first, clang_complete as fallback.
	    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
							    irony-cdb-clang-complete)) 
	    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

;; I use irony with company to get code completion.
(req-package 
  company-irony 
  :require company 
  irony 
  :config (progn (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

;; I use irony with flycheck to get real-time syntax checking.
(req-package 
  flycheck-irony 
  :require flycheck 
  irony 
  :config (progn (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

;; Eldoc shows argument list of the function you are currently writing in the echo area.
(req-package 
  irony-eldoc 
  :require eldoc 
  irony 
  :config (progn (add-hook 'irony-mode-hook #'irony-eldoc)))

;;==============================
;;     Docker Settings
;;==============================

;; dockerfile-mode
;; p-ins dockerfile-mode
(require 'dockerfile-mode)
(add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
(put 'dockerfile-image-name 'safe-local-variable #'stringp)

;; init-file ends here.
