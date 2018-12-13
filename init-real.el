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
;(require 'company)
;(require 'company-tern)



;; ==============================
;; Add web-mode projectile
;;==============================
;; Web-mode options

;;(require 'web-mode)
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;
;;(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
;;
;;(setq web-mode-markup-indent-offset 2)
;;(setq web-mode-code-indent-offset 2)
;;(setq web-mode-css-indent-offset 2)
;;
;;(setq web-mode-enable-auto-pairing t)
;;(setq web-mode-enable-auto-expanding t)
;;(setq web-mode-enable-css-colorization t)
;;;; Projectile install
;;;; Web-mode options
;;
;;(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;;
;;(setq web-mode-engines-alist '(("django" . "\\.html\\'")))
;;
;;(setq web-mode-markup-indent-offset 2)
;;(setq web-mode-code-indent-offset 2)
;;(setq web-mode-css-indent-offset 2)
;;
;;(setq web-mode-enable-auto-pairing t)
;;(setq web-mode-enable-auto-expanding t)
;;(setq web-mode-enable-css-colorization t)
;;





;;==============================
;; Markdown and preview settings
;;==============================

;; Add Markdown mode
;(add-to-list 'load-path "~/.emacs.d/markdown")
;(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
;(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;(autoload 'gfm-mode "markdown-mode" "Major mode for editing GitHub Flavored Markdown files" t)
;(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
;; Add Markdown Preview parser C-c C-c p



;;==============================
;;     JavaScript Env Settings
;;==============================
;; Install JavaScript-mode
;(require 'js2-mode)
;(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Better imenu


;; Js2-refactor and xref-js2
;(require 'js2-refactor)
;(require 'xref-js2)


;; Autocomplete in js mode
;; + company mode


;; JS run env
;; js-comint  js REPL in emacs
;(require 'js-comint)
;; default using node.js


;;==============================
;;     Julia Env Settings
;;==============================
;; download julia-mode.el from https://github.com/JuliaEditorSupport/julia-emacs/blob/master/julia-mode.el
;;(add-to-list 'load-path ".emacs.d/julia/julia-mode.el")
;;(require 'julia-mode


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

;;==============================
;;     Org-mode and extensions  Settings
;;==============================

(require 'org-wiki)

;;
;; (setq org-wiki-location "~/org/wiki")

(setq org-wiki-location-list
      '(
        "~/org-wiki"    ;; First wiki (root directory) is the default.
        ;;"~/Documents/wiki2 "
        ;;"~/Documents/wiki3"
        ))

;; Initialize first org-wiki-directory or default org-wiki
(setq org-wiki-location (car org-wiki-location-list))

(setq org-wiki-default-read-only nil)  ;; Default value
(setq org-wiki-server-port "8000") ;; 8000 - default value
(setq org-wiki-server-host "127.0.0.1") ;; Listen only localhost



;; javascript org-mode extension
(require 'ob-js)

(add-to-list 'org-babel-load-languages '(js . t))
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))

(setq org-wiki-template
      (string-trim
"
#+INCLUDE: theme/style.org
#+TITLE: %n
#+DESCRIPTION:
#+KEYWORDS:
#+STARTUP:  content
#+DATE: %d

- [[wiki:index][Index]]

- Related:

* %n
"))
;;==============================
;;     Mu  Settings
;;==============================
(when (eq system-type 'darwin)
  (add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu4e"))

(provide 'init)
;;; init.el ends here
