(require 'req-package)

(req-package company
  :ensure t
  :force t
  :require yasnippet
  :config
  (global-company-mode t)
  (add-hook 'after-init-hook 'global-company-mode)
  
  ;;(setq company-show-numbers t)
  ;;(setq company-minimum-prefix-length 2)
  ;;(setq company-dabbrev-downcase nil)
  (setq company-dabbrev-other-buffers t)
  ;;(setq company-auto-complete t)
  (setq company-dabbrev-code-other-buffers 'all)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-code-ignore-case t)
  ;;
  )

(req-package company-quickhelp
  :ensure t
  :require company
  :config (company-quickhelp-mode 1))

(provide 'init-company)
