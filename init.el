;;; package --- Summary
;;; Commentary:

;;; Code: goes here


					;(package-initialize)

(require 'package)

;; bootstrap utils

(defconst my-custom-file "~/.emacs.d/custom.el")

(setq custom-file my-custom-file)
(setq package-enable-at-startup nil)
(load my-custom-file t)
(setq auto-save-default nil)
(setq make-backup-files nil)

;;(put 'erase-buffer 'disabled nil)

;; turn off sctartup screen

(setq inhibit-splash-screen t)
(setq initial-scratch-message "==============================\n
     ***** Happy Hacking *****\n
============================== ")

;;(require 'org-wiki)

;; load extensions

(package-initialize)
(add-hook 'after-init-hook (lambda () 
			     (load "~/.emacs.d/init-real.el")))

(require 'subr-x)
(require 'org)
(require 'js-comint)
(require 'ob-js)
(require 'org-wiki)
(add-to-list 'org-babel-load-languages '(js . t))
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))

(setq org-wiki-location-list '("~/org-wiki" ;; First wiki (root directory) is the default.
			       ;;"~/Documents/wiki2 "
			       ;;"~/Documents/wiki3"
			       ))

;; Initialize first org-wiki-directory or default org-wiki
(setq org-wiki-location (car org-wiki-location-list))
(setq org-wiki-default-read-only nil)	;; Default value
(setq org-wiki-server-port "8000")	;; 8000 - default value
(setq org-wiki-server-host "127.0.0.1") ;; Listen only localhost
(add-to-list 'org-babel-load-languages '(js . t)) 
(org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages) 
(add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))
(setq org-wiki-template (string-trim "
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
