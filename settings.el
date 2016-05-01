(add-hook 'shell-mode-hook 'compilation-shell-minor-mode) ;;enable compile buffers in shell mode

;; (auto-complete-mode t)
(require 'imenu)
;; (elpy-enable)
(add-to-list 'auto-mode-alist '("\\.[Cc][Ss][Vv]\\'" . csv-mode))
(autoload 'csv-mode "csv-mode"
  "Major mode for editing comma-separated value files." t)
;; (paredit-mode 1)
(setq debug-on-error t)
(setq inferior-lisp-program "lein repl")
(add-to-list 'load-path "/usr/bin/clojure")
(add-to-list 'load-path "/usr/bin/python")
(add-to-list 'auto-mode-alist '("\.cljs$" . clojure-mode))
 (add-hook 'nrepl-mode-hook 'ac-nrepl-setup)
 ;; (add-hook 'nrepl-interaction-mode-hook 'ac-nrepl-setup)
 ;; (eval-after-load "auto-complete"
 ;;   '(add-to-list 'ac-modes 'nrepl-mode))
;; (defun set-auto-complete-as-completion-at-point-function ()
;;   (setq completion-at-point-functions '(auto-complete)))
;; (add-hook 'auto-complete-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'nrepl-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (add-hook 'nrepl-interaction-mode-hook 'set-auto-complete-as-completion-at-point-function)
;; (eval-after-load 'nrepl 
;;           '(define-key nrepl-mode-map ["\C-cC-c\"] 'nrepl-interrupt))

(add-to-list 'same-window-buffer-names "*nrepl*") 
(add-hook 'nrepl-mode-hook 'subword-mode)
;; (add-hook 'ess-mode-hook 'r-autoyas-ess-activate)
(setq-default indent-tabs-mode nil)
(setq synonyms-file        "~/mythesaurus/")
(setq synonyms-cache-file  "~/mythesaurus/cache")
;; (yas/global-mode 1)

;; (require 'org-clock) ;;load org mode clock
;; (require 'git)

(show-paren-mode 1);;always show bracket highlighting
(global-linum-mode 1);;always show line numbers
(global-visual-line-mode 1) ;;always wrap words visually
(global-font-lock-mode 1)
(transient-mark-mode t) ;;turn on transient mark mode, must have turned it off by accident. 
(setq x-select-enable-clipboard t) ;; enable clipboard in and out of emacs
(fset 'yes-or-no-p 'y-or-n-p) ;;allow y or n to stand for yes or no
(put 'erase-buffer 'disabled nil) ;;enable erase buffer command
(put 'set-goal-column 'disabled nil) ;;enable set goal column
;; (load-theme 'wheatgrass t)
(eval-after-load "tramp"
  '(progn
     (defvar sudo-tramp-prefix 
       "/sudo::" 
       (concat "Prefix to be used by sudo commands when building tramp path "))

     (defun sudo-file-name (filename) (concat sudo-tramp-prefix filename))

     (defun sudo-find-file (filename &optional wildcards)
       "Calls find-file with filename with sudo-tramp-prefix prepended"
       (interactive "fFind file with sudo ")      
       (let ((sudo-name (sudo-file-name filename)))
         (apply 'find-file 
                (cons sudo-name (if (boundp 'wildcards) '(wildcards))))))

     (defun sudo-reopen-file ()
       "Reopen file as root by prefixing its name with sudo-tramp-prefix and by clearing buffer-read-only"
       (interactive)
       (let* 
           ((file-name (expand-file-name buffer-file-name))
            (sudo-name (sudo-file-name file-name)))
         (progn           
           (setq buffer-file-name sudo-name)
           (rename-buffer sudo-name)
           (setq buffer-read-only nil)
           (message (concat "Set file name to " sudo-name)))))

     (global-set-key "\C-x+" 'sudo-find-file)
     (global-set-key "\C-x!" 'sudo-reopen-file)))
(setq scheme-program-name "guile")
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
;; (server-start)
(setq tramp-default-method "ssh")

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)



(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(setq sql-sqlite-program "sqlite3")

(server-start)
(add-hook 'prog-mode-hook 'subword-mode)
(setq
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
(global-set-key "\C-cp" 'run-python)
