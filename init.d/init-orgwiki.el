(require 'req-package)

;;==============================
;;     Org-mode and extensions  Settings
;;==============================

(require 'org-wiki)
(req-package 
  org-wiki 
  :ensure t 
  :force 
  :init
  ;;
  ;; (setq org-wiki-location "~/org/wiki")

  (setq org-wiki-location-list '("~/Documents/Core/I"
				 "~/org-wiki" ;; First wiki (root directory) is the default.
				 
				 ;;"~/Documents/wiki2 "
				 ;;"~/Documents/wiki3"
				 ))

  ;; Initialize first org-wiki-directory or default org-wiki
  (setq org-wiki-location (car org-wiki-location-list))

  (setq org-wiki-default-read-only nil)	  ;; Default value
  (setq org-wiki-server-port "8000")	  ;; 8000 - default value
  (setq org-wiki-server-host "127.0.0.1") ;; Listen only localhost
;; (setq org-wiki-clip-jar-path "~/bin/opt/clip.jar")
  


  (setq org-wiki-template (string-trim
			   "
#+INCLUDE: theme/style.org
#+TITLE: %n
#+LATEX_HEADER: \usepackage{fontspec}
#+LATEX_HEADER: \setmainfont{Times New Roman}
#+LATEX_HEADER: \setCJKmainfont[ItalicFont={STKaiti}]{STSong} 
#+DESCRIPTION:
#+KEYWORDS:
#+STARTUP:  content
#+DATE: %d

- [[wiki:index][Index]]

- Related:

* %n
"))
)



(provide 'init-orgwiki)
