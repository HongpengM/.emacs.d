(require 'package)


;; Add more package resources
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;;Set url proxy method
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;	("http" . "127.0.0.1:1080")
;;	("https" . "127.0.0.1:1080")))
(elpy-enable)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (magit projectile web-mode elpy))))

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

;; Magit status shotcut
(global-set-key (kbd "C-x g") 'magit-status)

;; Jedi for python autocompletion
;; install jedi server to start auto completion
;; M-x jedi:install-server
(setq python-environment-virualenv "/Users/k/anaconda3/bin/virtualenv")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;; Add exec path from shell
;; by Purcell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))
