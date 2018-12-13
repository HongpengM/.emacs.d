(require 'req-package)

(req-package projectile
  :config
  '(projectile-mode t nil (projectile))
  ;;C-c p p  ;; switch projects
  (global-set-key (kbd "C-c p p") 'projectile-switch-project)
  ;;C-c p f  ;; list project files
  (global-set-key (kbd "C-c p f") 'projectile--find-file)
  ;;C-c p g  ;; grep project
  (global-set-key (kbd "C-c p g") 'projectile-grep)
  ;; Set projects search path)
)

(provide 'init-projectile)
