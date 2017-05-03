
;; Ctrl+h にbackspaceを割り当て
(keyboard-translate ?\C-h ?\C-?)
(define-key key-translation-map [?\C-h] [?\C-?])

;; Ctrl+t に フレーム移動を割り当て
;; フレームがないときは新規フレーム作成+画面分割
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;;UNDO
;;(global-set-key "\C-z" 'undo)



