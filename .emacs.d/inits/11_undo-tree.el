
;; undo-tree
(require 'undo-tree)
(when (require 'undo-tree nil t)
  (global-undo-tree-mode t))
(global-set-key (kbd "\C-z") 'undo-tree-undo)




