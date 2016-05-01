;; (global-set-key "\C-cn" 'nrepl-jack-in)
(global-set-key "\C-cg" 'magit-status)
(global-set-key "\C-cm" 'man)
(global-set-key "\C-cr" 'replace-string); keybinding for replace string
(global-set-key "\C-cs" 'shell); keybinding to start shell process
;; (global-set-key "\C-xp" 'check-parens); keybinding to  check for unbalanced
;;parens
(global-set-key "\C-xt" 'transpose-lines); keybinding to transpose lines
(global-set-key "\C-c\M-k" 'ess-eval-chunk) ;;eval chunk in noweb file
;;org mode keybindings
(global-set-key (kbd "\C-cw") 'balance-windows)
(global-set-key "\C-cl" 'org-store-link) 
     (global-set-key "\C-cc" 'org-capture)
     (global-set-key "\C-ca" 'org-agenda)
     (global-set-key "\C-cb" 'org-iswitchb)
(local-set-key "\C-cC-e" 'ess-eval-chunk)
(local-set-key "\C-cC-h" 'ess-sos)
(global-set-key "\C-xc" 'inferior-lisp)
(global-set-key (kbd "M-j")
            (lambda ()
                  (interactive)
                  (join-line -1)))
;; (mapc 'global-unset-key '([left] [right] [up] [down]));;learned this now, no need to keep the training wheels on
(defun create-key-group (prefix &rest commands)
  "Creates a group of key bindings by making a sparse keymap
bound to the first argument, a vector describing a key.
The rest of the arguments should be cons pairs mapping
single characters to commands."
  (global-set-key prefix (make-sparse-keymap))
  (dolist (command commands)
    (global-set-key (vconcat prefix (vector (car command)))
                    (cdr command))))
