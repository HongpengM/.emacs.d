(require 'req-package)

(req-package 
  youdao-dictionary 
  :force t 
  :config

  ;; Enable Cache
  (setq url-automatic-caching t)

  ;; Example Key binding
  (global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point))

(provide 'init-dict)
