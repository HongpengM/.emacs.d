;;;

;;; Codes: go here

;; start emacs server

(require 'server)
(unless (server-running-p)
  (server-start))

;; elpa

(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")))

(defconst my-init-dir "~/.emacs.d/init.d")
(eval-when-compile (package-initialize))

(defun require-package (package)
  "refresh package archives, check package presence and install if it's not installed"
  (if (null (require package nil t))
      (progn (let* ((ARCHIVES (if (null package-archive-contents)
                                  (progn (package-refresh-contents)
                                         package-archive-contents)
                                package-archive-contents))
                    (AVAIL (assoc package ARCHIVES)))
               (if AVAIL
                   (package-install package)))
             (require package))))

;; use package

(require-package 'use-package)
(require 'use-package)

;; el-get

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(require-package 'el-get)
(require 'el-get)
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get/el-get/recipes")
(el-get 'sync)

;; :el-get keyword for use-package

(use-package use-package-el-get
  :ensure t
  :config (use-package-el-get-setup))

;; chords

(use-package use-package-chords
  :ensure t)

;; req-package

(use-package req-package
  :ensure t
  :config (req-package--log-set-level 'debug))

;; init.d

(random t)

(req-package load-dir
  :ensure t
  :force true
  :init
  (setq force-load-messages nil)
  (setq load-dir-debug nil)
  (setq load-dir-recursive t)
  :config
  (load-dir-one my-init-dir)
  (req-package-finish)
  (funcall 'select-theme))

;; Add exec path from shell ;; after package-initialize
;; by Purcell
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

;; Magit panel
(global-set-key (kbd "C-x g") 'magit-status)


;;; ###
;;Set url proxy method
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;	("http" . "127.0.0.1:1080")
;;	("https" . "127.0.0.1:1080")))



;;------------------------------
;; Projectile settings
;(require 'projectile)
;;C-c p p  ;; switch projects
;;(global-set-key (kbd "C-c p p") 'projectile-switch-project)
;;C-c p f  ;; list project files
;;(global-set-key (kbd "C-c p f") 'projectile--find-file)
;;C-c p g  ;; grep project
;;(global-set-key (kbd "C-c p g") 'projectile-grep)
;; Set projects search path
;;(setq projectile-project-search-path '("~/Gitlab/" "~/Github/"))

;; ------------------------------
;; Magit settings for Git
;; Magit status shotcut



;;==============================
;; Elpy settings
;;==============================



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 
 '(package-selected-packages
   (quote
    (htmlize org-wiki nvm js-comint dockerfile-mode ensime paredit epm geiser julia-mode company-tern xref-js2 js2-refactor js2-mode markdown-mode magit projectile web-mode elpy)))
 )

;; Autocomplete
(req-package company)
(req-package company-tern
  :config
  (add-to-list 'company-backends 'company-tern)
  )

(provide 'init)
;;; init.el ends here
