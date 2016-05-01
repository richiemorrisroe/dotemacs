(add-to-list 'load-path  "~/Dropbox/Elisp/")
(require 'cl)
(package-initialize)
;; (elpy-enable)
(add-to-list 'package-archives '(
                                 ("marmalade" .
                                  "http://marmalade-repo.org/packages/")
                                 ("melpa" . "https://melpa.milkbox.net/packages/")
                                 ("gnu" . "https://elpa.gnu.org/packages/")))

(require 'tramp)

