(require 'req-package)

;;==============================
;;     C++ & C Settings
;;==============================



;; Irony
;; Ref:  http://martinsosic.com/development/emacs/2017/12/09/emacs-cpp-ide.html
(req-package
  irony
  :config (progn
	    ;; If irony server was never installed, install it.
	    (unless (irony--find-server-executable)
	      (call-interactively #'irony-install-server))
	    (add-hook 'c++-mode-hook 'irony-mode)
	    (add-hook 'c-mode-hook 'irony-mode)

	    ;; Use compilation database first, clang_complete as fallback.
	    (setq-default irony-cdb-compilation-databases '(irony-cdb-libclang
							    irony-cdb-clang-complete))
	    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)))

;; I use irony with company to get code completion.
(req-package
  company-irony
  :require company
  irony
  :config (progn (eval-after-load 'company '(add-to-list 'company-backends 'company-irony))))

;; I use irony with flycheck to get real-time syntax checking.
(req-package
  flycheck-irony
  :require flycheck
  irony
  :config (progn (eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))))

;; Eldoc shows argument list of the function you are currently writing in the echo area.
(req-package
  irony-eldoc
  :require eldoc
  irony
  :config (progn (add-hook 'irony-mode-hook #'irony-eldoc)))


(provide 'init-cc)
