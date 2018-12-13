(require 'req-package)

(elpy-enable)
(setq elpy-rpc-python-command "python")

;;==============================
;; Jedi: Python autocomplete
;;==============================
;; Jedi for python autocompletion
;; install jedi server to start auto completion
;; M-x jedi:install-server
(setq python-environment-virualenv "/Users/k/anaconda3/bin/virtualenv")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


(provide 'init-python)
