(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
(add-to-list 'package-archives '("tromey" . "http://tromey.com/elpa/") t)
(package-initialize)

(when (not package-archive-contents) (package-refresh-contents))

;; Add in your own packages
(defvar my-packages
  '(starter-kit
    starter-kit-lisp
    starter-kit-ruby
    starter-kit-js
    starter-kit-lisp
    ace-jump-mode
    autopair
    auto-complete
    auto-dictionary
    full-ack
    evil
    undo-tree
    magit
    vline
    windresize
    haml-mode
    markdown-mode
    sass-mode
    scss-mode
    yaml-mode
    rainbow-mode
    coffee-mode
    csv-mode
    inf-ruby
    ruby-end
    rvm
    rinari
    ruby-block
    ))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; load colors theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/colors/")

(load-theme 'tango-dark)
(evil-mode 1)
(global-linum-mode 1)
(global-hl-line-mode 1)
(setq linum-format "%4d ")
(windmove-default-keybindings)

;; Hooks
(add-hook 'ruby-mode-hook (lambda () (rvm-activate-corresponding-ruby)))

;; highlight indentation
(setq-default highlight-indent-active 1)

;; Set highlight line color
(set-face-background 'hl-line "#333333")

(custom-set-variables
 (custom-set-faces
   '(hl-line ((t (:background "#333333"))))))
