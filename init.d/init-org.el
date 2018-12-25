(require 'req-package)

(req-package 
  org 
  :ensure t 
  :force t 
  :mode ("\\.org$" . org-mode) 
  :bind (("C-c l" . org-store-link) 
	 ("C-c c" . org-capture) 
	 ("C-c a" . org-agenda) 
	 ("C-'" . org-cycle-agenda-files) 
	 ("C-c b" . org-iswitchb)) 
  :config (progn 
	    (setq org-default-notes-file (concat org-directory "/notes.org")) 
	    (setq org-tags-column -110) 
	    (setq org-capture-bookmark t) 
	    (setq org-refile-use-outline-path 'file) 
	    (setq org-startup-folded 'showeverything) 
	    (setq org-log-done 'note) 

	    ;; TODO change colors to faces using defface
	    (setq org-todo-keyword-faces '(("TODO" . org-todo)
					   ("WAIT" .
					    (:foreground "white"
							 :background "#f98125"
							 :weight bold))
					   ("DELAYED" .
					    (:foreground "white"
							 :background "#f44242"
							 :weight bold))
					   ("REPORT" . org-todo)
					   ("BUG" .
					    (:foreground "yellow"
							 :background "red"
							 :weight bold))
					   ("KNOWNCAUSE" .
					    (:foreground "white"
							 :background "#cb4df9"
							 :weight bold))
					   ("VERY IMPORTANT!" .
					    (:foreground "red"
							 :background "yellow"
							 :weight bold))
					   ("SLEEP" .
					    (:foreground "blue"
							 :background "#95d5f9"
							 :weight bold))
					   ("CANCELED" . 
					    (:foreground "blue"
							 :background "#95d5f9"
							 :weight bold)))) 
	    (setq org-agenda-files '("~/Orgs/today.org"
				     "~/Orgs/company.org"
				     "~/Orgs/learning.org"
				     "~/Orgs/application.org"
				     "~/org-wiki")) 
	    (define-key org-mode-map (kbd "C-M-\\") 'org-indent-region)))

(setq org-todo-keywords '((sequence "TODO(t)" "WAIT(w@)" "|" "DONE(d)") 
			  (sequence "REPORT(r@)" "BUG(b@)" "KNOWNCAUSE(k@)" "|" "FIXED(f)") 
			  (sequence "DELAYED(e@)" "|" "CANCELED(c)")
			  (sequence "VERY IMPORTANT!(v@)" "|" "SLEEP(s@)")))
     
      
;; org-mode javascript extensions
(req-package 
  ob-js)
(require 'org-download)
(org-babel-do-load-languages 'org-babel-load-languages '(
							 ;; ...
							 (python . t)
							 (js . t)
							 (scheme . t)))
  (add-to-list 'org-babel-load-languages '(js . t))
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-load-languages)
  (add-to-list 'org-babel-tangle-lang-exts '("js" . "js"))

;; (load "~/.emacs.d/init.d/ob-scheme.el")


;;(req-package org-pomodoro
;;  :ensure t
;;  :commands org-pomodoro
;;  :config
;;  (add-hook
;;   'org-pomodoro-finished-hook
;;   (lambda ()
;;     (shell-command "play ~/.emacs.d/pomodoro-stop.mp3")
;;     (browse-url "'https://duckduckgo.com/?q=cats&iax=images&ia=images'")))
;;  (add-hook
;;   'org-pomodoro-break-finished-hook
;;   (lambda ()
;;     (shell-command "play ~/.emacs.d/pomodoro-start.mp3")
;;     (async-shell-command "emacsclient --no-wait ~/Work")))
;;  :bind (("C-c p" . org-pomodoro)))
;;



(req-package org-download
  :ensure t
  :force t)

(provide 'init-org)
