;; Show line number
;;(global-linum-mode t)			; always show line numbers
;; linum-mode on programming mode
(add-hook 'prog-mode-hook 'linum-mode)
(setq linum-format "%d| ")		;set format
;; Automatically add pair
(electric-pair-mode t)

;;------------------------------

;;-------------------------------
;; Insert today's date
(defun insert-current-date ()
  (interactive)
  (insert (shell-command-to-string "echo -n $(date +%Y-%m-%d)")))

;; Interactive-do-mode on
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)



;;------------------------------
;; 1. Window split redo & undo
;; Package-Install winner-mode
;; Automatically start with winner-mode
;; Winner mode Shortcuts:
;; C-c <- : undo
;; C-c -> : redo
(when (fboundp 'winner-mode)
  (winner-mode 1))

;; 2. Window split move with directions
;; Window move key bindings
(global-set-key (kbd "C-c w <left>")  'windmove-left)
(global-set-key (kbd "C-c w <right>") 'windmove-right)
(global-set-key (kbd "C-c w <up>")    'windmove-up)
(global-set-key (kbd "C-c w <down>")  'windmove-down)
;; Frame move binds with wind move
;; Add framemove to load path
(add-to-list 'load-path "~/.emacs.d/package_manual")

;; 3. Automatically refresh package content
(when (not package-archive-contents)
  (package-refresh-contents))

;;------------------------------
;; Material Theme
;(load-theme 'material t)
;;(load-theme 'material-light t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-command "/usr/local/bin/macdown")
 '(package-selected-packages
   (quote
    (## htmlize org-wiki nvm js-comint dockerfile-mode ensime paredit epm geiser julia-mode company-tern xref-js2 js2-refactor js2-mode markdown-mode magit projectile web-mode elpy)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))



