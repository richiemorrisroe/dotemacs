(package-initialize)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/ess")
(require 'ess-site)
(setq initial-buffer-choice "~/.emacs.d/init.el")
(load "~/.emacs.d/packages.el")
(load "~/.emacs.d/settings.el")

(load "~/.emacs.d/latexEss.el")
(load "~/.emacs.d/keybindings.el")
;;; 
(require 'cedet)
(require 'semantic)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((R . t)
   (emacs-lisp . t)
   (sql . t)
   (python . t)
   (latex . t)
   (sh . t)
   ))

(load-theme 'wheatgrass t)

(load "semantic/loaddefs.el")
;(;; semantic-mode 1);;
;;; 
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package flycheck bash-completion auctex magit)))
 '(safe-local-variable-values
   (quote
    ((TeX-default-extension . "Rnw")
     (TeX-master . "ThesisContents030511")))))
;; (desktop-save-mode t)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq sentence-end-double-space nil)
(global-set-key (kbd "C-S-o") 'counsel-rhythmbox)


(setq tab-always-indent 'complete)
(setq ess-tab-complete-in-script t)
     ;; Add opam emacs directory to the load-path
   ;;   (setq opam-share (substring (shell-command-to-string "opam config var share 2> /dev/null")
   ;; 0 -1))
   ;;   (add-to-list 'load-path (concat opam-share "/emacs/site-lisp"))
     ;; Load merlin-mode
     (require 'merlin)
     ;; Start merlin on ocaml files
     (add-hook 'tuareg-mode-hook 'merlin-mode t)
     (add-hook 'caml-mode-hook 'merlin-mode t)
     ;; Enable auto-complete
     (setq merlin-use-auto-complete-mode 'easy)
     ;; Use opam switch to lookup ocamlmerlin binary
     (setq merlin-command 'opam)
(add-to-list
 'load-path
 (replace-regexp-in-string
  "\n" "/share/emacs/site-lisp"
  (shell-command-to-string "opam config var prefix")))

;; Automatically load utop.el
(autoload 'utop "utop" "Toplevel for OCaml" t)
;; (setq utop-command "opam config exec -- utop -emacs")
(add-to-list 'display-buffer-alist '("*shell*" display-buffer-same-window))
;; (add-to-list 'load-path "~/.emacs.d/elpa/php+-mode-20121129.1252/")
;; (require 'php+-mode)
;; (php+-mode-setup)
(add-to-list 'load-path "/usr/share/hhvm/hack/emacs")
(require 'hack-mode)
(require 'hack-for-hiphop)
;;this was fucking bullshit, broke using shell mode.
;; (key-chord-define-global
;;  "--"
;;  (lambda ()
;;    "insert an underscore."
;;    (interactive)
;;    (insert "--")))
(key-chord-mode t)
