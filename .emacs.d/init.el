;; proxy
;; (setq url-proxy-services '(("http" . "proxy.hoge.hoge:80")))

;; package
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") )
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(fset 'package-desc-vers 'package--ac-desc-version)
(package-initialize)

;; cask & pallet
(require 'cask "~/.cask/cask.el")
(cask-initialize)
(require 'pallet)
(pallet-mode t)

;; 環境を日本語、UTF-8にする
(set-locale-environment nil)
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(prefer-coding-system 'utf-8)

;; Ctrl+h にbackspaceを割り当て
(keyboard-translate ?\C-h ?\C-?)

;; スタートアップメッセージを表示させない
(setq inhibit-startup-message t)

;; バックアップファイルを作成させない
(setq make-backup-files nil)

;; 終了時にオートセーブファイルを削除する
(setq delete-auto-save-files t)

;; タブにスペースを使用する
(setq-default tab-width 4 indent-tabs-mode nil)

;; メニューバーを消す
(menu-bar-mode -1)

;; 列数を表示する
(column-number-mode t)

;; 行数を表示する
(global-linum-mode t)

;; 対応する括弧を光らせる
(show-paren-mode 1)

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;; バッファ自動再読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファ名の識別文字列を変更する
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;選択部分を一気にインデントにする indent-region のキーバインドの設定
(global-set-key "\C-x\C-i" 'indent-region)

;; Ctrl+t に フレーム移動を割り当て
;; フレームがないときは新規フレーム作成+画面分割
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(global-set-key (kbd "C-t") 'other-window-or-split)

;; helm
;; (setq load-path (cons "~/.emacs.d/helm-master/" load-path))                                          
;; (require 'helm-config)                                                                               
;; (helm-mode 1)                                                                                        
;; (helm-descbinds-mode)                                                                                
;; (define-key global-map (kbd "M-x")     'helm-M-x)                                                    
;; (global-set-key (kbd "C-q") 'helm-mini)                                                              
;; (define-key global-map (kbd "C-x C-f") 'helm-find-files)                                             
;; (define-key global-map (kbd "C-x C-r") 'helm-recentf)                                                
;; (define-key global-map (kbd "M-y")     'helm-show-kill-ring)                                         
;; (define-key global-map (kbd "C-c i")   'helm-imenu)                                                  
;; (define-key global-map (kbd "C-x b")   'helm-buffers-list)                                           
;; (define-key helm-map (kbd "C-h") 'delete-backward-char)                                              
;; (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)                                   
;; (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)                         
;; (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)                          
;; (define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)                                    
;; (global-set-key (kbd "C-c b") 'helm-descbinds)                                                       
;; (define-key global-map (kbd "C-c o")     'helm-occur) 

;; helm-occur と helm-swoop の使い分け                                                               
;; migemo なしで helm-swoop を使う                                                                   
;; (require 'cl)                                                                                        
;; (cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))                          
;;   (interactive)                                                                                      
;;   (let (helm-migemo-mode)                                                                            
;;     (helm-swoop :$query $query :$multiline $multiline)))                                             

;; C-s でisearch, C-u C-s で helm-occur or helm-swoop, C-u C-u C-s で nomigemo helm-swoop            
;; (defun isearch-forward-or-helm-swoop-or-helm-occur (use-helm-swoop)                                  
;;   (interactive "p")                                                                                  
;;   (let (current-prefix-arg                                                                           
;;         (helm-swoop-pre-input-function 'ignore))                                                     
;;     (call-interactively                                                                              
;;      (case use-helm-swoop                                                                            
;;            (1 'isearch-forward)                                                                      
;;            ;; C-u C-sを押した場合                                                                    
;;            ;; 1000000以上のバッファサイズならばhelm-occur、                                          
;;            ;; それ以下ならばhelm-swoop                                                               
;;            (4 (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))                                
;;            ;; C-u C-u C-sでmigemoなしのhelm-swoop                                                    
;;            (16 'helm-swoop-nomigemo)))))                                                             
;; (global-set-key (kbd "C-s") 'isearch-forward-or-helm-swoop-or-helm-occur)                            

;; helm-ag                                                                                           
;; (require 'helm-ag)                                                                                
;; (setq helm-ag-base-command "ag --nocolor --nogroup ")                                             
;; (global-set-key (kbd "C-c s") 'helm-ag)  

;; Emulate `kill-line' in helm minibuffer
;; (setq helm-delete-minibuffer-contents-from-point t)
;; (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
;;   "Emulate `kill-line' in helm minibuffer"
;;     (kill-new (buffer-substring (point) (field-end))))


;; undo-tree
(require 'undo-tree)
(when (require 'undo-tree nil t)
  (global-undo-tree-mode t))
(global-set-key (kbd "\C-z") 'undo-tree-undo)

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

