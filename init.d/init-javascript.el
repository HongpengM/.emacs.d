(require 'req-package)

(req-package 
  js2-mode 
  :ensure t 
  :force t 
  :mode "\\.js\\'" 
  :config (add-hook 'js2-mode-hook #'js2-imenu-extras-mode) 
  (setq js2-basic-offset 2))

(req-package 
  js2-refactor 
  :require js2-mode
  :force t 
  :config (add-hook 'js2-mode-hook #'js2-refactor-mode) 
  (js2r-add-keybindings-with-prefix "C-c C-r") 
  (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

  ;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
  ;; unbind it.
  (define-key js-mode-map (kbd "M-.") nil)
  (add-hook 'js2-mode-hook (lambda () 
			     (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(req-package 
  xref-js2 
  :force t 
  :config
  ;; Disable completion keybindings, as we use xref-js2 instead
  (define-key tern-mode-keymap (kbd "M-.") nil) 
  (define-key tern-mode-keymap (kbd "M-,") nil))

(req-package 
  js-comint 
  :config (setq js-comint-program-command "node") 
  (setq js-comint-program-arguments '("--interactive"))
  ;; Clean output when using node.js
  (defun inferior-js-mode-hook-setup () 
    (add-hook 'comint-output-filter-functions 'js-comint-process-output)) 
  (add-hook 'inferior-js-mode-hook 'inferior-js-mode-hook-setup t)
  ;; Shortcut settings
  (add-hook 'js2-mode-hook (lambda () 
			     (local-set-key (kbd "C-x C-e") 'js-send-last-sexp) 
			     (local-set-key (kbd "C-c b") 'js-send-buffer) 
			     (local-set-key (kbd "C-c C-b") 'js-send-buffer-and-go))))

;; auto complete
(add-hook 'js2-mode-hook (lambda () 
			   (tern-mode) 
			   (company-mode)))


(provide 'init-javascript)
