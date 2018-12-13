(require 'req-package)

(req-package scala-mode
  :ensure t
  :config (progn (setq scala-indent:align-parameters t))
  :mode (("\\.scala\\'" . scala-mode)
         ("\\.sc\\'" . scala-mode)))

(req-package sbt-mode
  :ensure t
  :commands sbt-start)

(req-package ensime
  :ensure t
  :require scala-mode
  :config
  (add-hook-exec 'scala-mode 'ensime-scala-mode-hook)
;;  (add-to-list 'exec-path "/usr/local/bin")
  )

(provide 'init-scala)
