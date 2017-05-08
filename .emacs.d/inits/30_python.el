
;;; Elpy を有効化
(elpy-enable)
;;; 仮想環境を設定
(defvar venv-default "~/.pyenv/versions/3.5.0")

;;; デフォルト環境を有効化
(pyvenv-activate venv-default)

;;; REPL 環境に IPython を使う
(elpy-use-ipython)

;;; 自動補完のバックエンドとして Rope か Jedi を選択
;(setq elpy-rpc-backend "jedi")

;; インデントのハイライト
;; カーソル位置のみ
(set-face-background 'highlight-indentation-face "#313131")
(set-face-background 'highlight-indentation-current-column-face "#777777")
(add-hook 'elpy-mode-hook 'highlight-indentation-current-column-mode)

;; jedi
;(add-hook 'python-mode-hook 'jedi:setup)
;(setq jedi:complete-on-dot t)  


