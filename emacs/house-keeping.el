;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Faster startup hax
;; (setq gc-cons-threshold 402653184 ;;; https://www.gnu.org/software/emacs/manual/html_node/elisp/Garbage-Collection.html
;;       gc-cons-percentage 0.6)     ;;; gc-cons-threshold determines how many bytes can be allocated without triggering a garbage collection. The default value is 800000 (i.e., ~800kB)

;; (defvar startup/file-name-handler-alist file-name-handler-alist)
;; (setq file-name-handler-alist nil)

;; (defun startup/revert-file-name-handler-alist ()
;;     (setq file-name-handler-alist startup/file-name-handler-alist))

;; (defun startup/reset-gc ()
;;     (setq gc-cons-threshold 16777216
;;           gc-cons-percentage 0.1))

;; (add-hook 'emacs-startup-hook 'startup/revert-file-name-handler-alist)
;; (add-hook 'emacs-startup-hook 'startup/reset-gc)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Add MELPA

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

;; Without this line, (package-initialize) is executed twice.
;; Once during evaluation of this file, and another after Emacs finishes reading init.el
;; (setq package-enable-at-startup nil)
;; (package-initialize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Use-Package

(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package))

(setq
    use-package-always-defer t
    use-package-always-ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; STRAIGHT
;;; https://github.com/raxod502/straight.el

;; (defvar bootstrap-version)
;; (let ((bootstrap-file
;;     (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
;;     (bootstrap-version 5))
;;     (unless (file-exists-p bootstrap-file)
;;         (with-current-buffer
;;         (url-retrieve-synchronously
;;             "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
;;             'silent 'inhibit-cookies)
;;         (goto-char (point-max))
;;         (eval-print-last-sexp)))
;;     (load bootstrap-file nil 'nomessage))
