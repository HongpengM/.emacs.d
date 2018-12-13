(require 'req-package)

;; yaml

(req-package yaml-mode
  :ensure t
  :mode "\\.yml\\'"
  :config
  (add-hook 'yaml-mode-hook (lambda ()
			    (define-key yaml-mode-map "\C-m" 'newline-and-indent)))
)

(provide 'init-yaml)
