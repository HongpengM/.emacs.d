
# Emacs PythonIDE setup

## 1 Init file
emacs init file path:
~/.emacs.d/init.el
### 1.1 Reload init file
Evaluate Everything: M-x eval-buffer
Evaluate Select part: M-x eval-region

### 1.2 Start Emacs with custom file
emacs -q -l ~/my-init-file.el

## 2 Setup package manager
Change default OSX Emacs 22.1 to new Download one
```Shell
# Set new emacs replace default one
export PATH=/Applications/Emacs.app/Contents/MacOS:$PATH
# Emacs start in terminal
alias emacs="emacs -nw"% 
```

Add more repos in `init.el`
```elisp
;; Add more package resources
(setq package-archives
  '(("gnu" . "http://elpa.gnu.org/packages/")
    ("marmalade" . "https://marmalade-repo.org/packages/")
    ("melpa" . "http://melpa.milkbox.net/packages/")))

```


## 3 Default Python-mode
```Shell 
M-x python-mode
```

## 4 Elpy
Best package for python development.
```Shell
pip install rope jedi flake8 importmagic
M-x package-install <RET> elpy
```
Show docs of a variable/module
`C-c C-d ;; elpy-doc`
Code Navigation (like hyperlinks)
`M-. ;; elpy-goto-definition` and back `M-* ;; elpy-tag-mark`


### 4.1 Debug

```python
import ipdb
ipdb.set_trace()
```

### 4.2 Test
`M-x elpy-set-test-runner`
And
`C-c C-t ;; runs test/ all tests`

### 4.3 Virtualenv
`M-x pyvenv-workon` `M-x pyvenv-activate` `M-x pyvenv-deactivate`


## 5 Web-mode install

`M-x package-install <RET> web-mode <RET>`
Settings in `init.el`
```elisp
;; Web-mode options                                                                                 
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(setq web-mode-engines-alist '(("django" . "\\.html\\'")))

(setq web-mode-markup-indent-offset 2)
(setq web-mode-code-indent-offset 2)
(setq web-mode-css-indent-offset 2)

(setq web-mode-enable-auto-pairing t)
(setq web-mode-enable-auto-expanding t)
(setq web-mode-enable-css-colorization t)
```

## 6 projectile
`M-x package-install <RET> projectile <RET>`
Settings in `init.el`
```elisp
;;C-c p p  ;; switch projects
(global-set-key (kbd "C-c p p") 'projectile-switch-project)
;;C-c p f  ;; list project files
(global-set-key (kbd "C-c p f") 'projectile--find-file)
;;C-c p g  ;; grep project
(global-set-key (kbd "C-c p g") 'projectile-grep)

```


## 7 Magit
`M-x package-install <RET> magit <RET>`
Settings in `init.el`
```elisp
;; Magit status shotcut
(global-set-key (kbd "C-x g") ’magit-status)
```


## 8 Jedi
Jedi is a package serves for python autocompletion
`M-x package-install <RET> jedi <RET>`
Be sure to `M-x jedi:install-server` to enable jedi server for autocomplete

```elisp
;; Jedi for python autocompletion
;; install jedi server to start auto completion
;; M-x jedi:install-server
(setq python-environment-virualenv "/Users/k/anaconda3/bin/virtualenv")
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
```

## 9 Install Material Theme
emacs Material Theme maintained on https://github.com/cpaulik/emacs-material-theme
By download 2 themes using wget
```Shell
wget https://raw.githubusercontent.com/cpaulik/emacs-material-theme/master/material-theme.el
wget https://raw.githubusercontent.com/cpaulik/emacs-material-theme/master/material-light-theme.el
```
move 2 files to ~/.emacs.d/
Add settings in `init.el`
```elisp
;; Material Theme
(load-theme 'material t)
;;(load-theme 'material-light t)
```

#Tips
### Fetch detached Emacs session
```Shell
fg %emacs
```
### Clear Shell output in Emacs
Run command: `C-c M-o` or `M-x comint-clear-buffer`
Previous command in old Shell: `M-p` or `C-<UP>`
Next command in old Shell: `M-n` or `C-<Down>`


