(require 'package)


;; Add more package resources
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)
;;Set url proxy method
;;(setq url-proxy-services
;;      '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;	("http" . "127.0.0.1:1080")
;;	("https" . "127.0.0.1:1080")))
(elpy-enable)
