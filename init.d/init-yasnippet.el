(require 'req-package)

(req-package yasnippet
  :ensure t
  :force t
  :config (progn (yas-global-mode t)
                 (define-key yas-minor-mode-map (kbd "C-M-y") 'yas-expand)))

(provide 'init-yasnippet)
