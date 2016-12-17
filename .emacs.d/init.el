
;; cask & pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize) 
(require 'pallet)
(pallet-mode t)

;; init-loader
(require 'init-loader)
(init-loader-load "~/dotfiles/.emacs.d/inits/")
(setq init-loader-show-log-after-init t)

