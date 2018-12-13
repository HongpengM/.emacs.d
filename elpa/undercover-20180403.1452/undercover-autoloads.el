;;; undercover-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "undercover" "undercover.el" (0 0 0 0))
;;; Generated autoloads from undercover.el

(autoload 'undercover "undercover" "\
Enable test coverage for files matched by CONFIGURATION.
Example of CONFIGURATION: (\"*.el\" \"subdir/*.el\" (:exclude \"exclude-*.el\")).

If running under Travic CI automatically generate report
on `kill-emacs' and send it to coveralls.io.

\(fn &rest CONFIGURATION)" nil t)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "undercover" '("undercover-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; undercover-autoloads.el ends here
