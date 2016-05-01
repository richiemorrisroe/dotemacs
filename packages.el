(add-to-list 'load-path  "~/Dropbox/Elisp/")
(require 'cl)
(package-initialize)
;; (elpy-enable)
    (setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                             ("gnu" . "https://elpa.gnu.org/packages/")
                             ("marmalade" . "https://marmalade-repo.org/packages/")))
(require 'tramp)

