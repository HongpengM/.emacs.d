(require 'req-package)

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

(provide 'init-orgwiki)
