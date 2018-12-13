(require 'req-package)

(req-package markdown-mode
  :ensure t :mode "\\.md\\'"
  :config
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (autoload 'gfm-mode "markdown-mode" "Major mode for editing GitHub Flavored Markdown files" t)
  (add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))
  )

(provide 'init-markdown)
