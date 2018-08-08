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
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
;;Set url proxy method
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;	("http" . "127.0.0.1:1080")
;;	("https" . "127.0.0.1:1080")))

;; Add exec path from shell
;; by Purcell
;;(when (memq window-system '(mac ns x))
;;  (exec-path-from-shell-initialize))

;;==============================
;; Elpy settings
;;==============================
(elpy-enable)
(setq elpy-rpc-python-command "python3")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/preview")
 '(package-selected-packages
   (quote
    (company-tern xref-js2 js2-refactor js2-mode markdown-mode magit projectile web-mode elpy)))
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
(custom-set-variables '(markdown-command "/usr/local/bin/macdown"))


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

