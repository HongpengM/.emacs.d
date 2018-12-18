(pdf-tools-install)
(pdf-loader-install)

(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
