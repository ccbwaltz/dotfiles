
;; helm
(setq load-path (cons "~/.emacs.d/helm-master/" load-path))
(require 'helm-config)
(helm-mode 1)
(helm-descbinds-mode)
(define-key global-map (kbd "M-x")     'helm-M-x)
(global-set-key (kbd "C-q") 'helm-mini)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key global-map (kbd "M-y")     'helm-show-kill-ring)
(define-key global-map (kbd "C-c i")   'helm-imenu)
(define-key global-map (kbd "C-x b")   'helm-buffers-list)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(global-set-key (kbd "C-c b") 'helm-descbinds)
(define-key global-map (kbd "C-c o")     'helm-occur)

;; helm-occur と helm-swoop の使い分け
;; migemo なしで helm-swoop を使う
(require 'cl)
(cl-defun helm-swoop-nomigemo (&key $query ($multiline current-prefix-arg))
  (interactive)
  (let (helm-migemo-mode)
    (helm-swoop :$query $query :$multiline $multiline)))

;; C-s でisearch, C-u C-s で helm-occur or helm-swoop, C-u C-u C-s で nomigemo helm-swoop
(defun isearch-forward-or-helm-swoop-or-helm-occur (use-helm-swoop)
  (interactive "p")
  (let (current-prefix-arg
        (helm-swoop-pre-input-function 'ignore))
    (call-interactively
     (case use-helm-swoop
           (1 'isearch-forward)
           ;; C-u C-sを押した場合
           ;; 1000000以上のバッファサイズならばhelm-occur
           ;; それ以下ならばhelm-swoop
           (4 (if (< 1000000 (buffer-size)) 'helm-occur 'helm-swoop))
           ;; C-u C-u C-sでmigemoなしのhelm-swoop
           (16 'helm-swoop-nomigemo)))))
(global-set-key (kbd "C-s") 'isearch-forward-or-helm-swoop-or-helm-occur)

;; helm-ag
;; (require 'helm-ag)
;; (setq helm-ag-base-command "ag --nocolor --nogroup ")
;; (global-set-key (kbd "C-c s") 'helm-ag)

;; Emulate `kill-line' in helm minibuffer
(setq helm-delete-minibuffer-contents-from-point t)
(defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
  "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))


