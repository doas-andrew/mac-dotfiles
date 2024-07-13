;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONTENTS

;;; 1 - Imports
;;; 2 - Packages
;;; 3 - Defaults
;;; 4 - Keybinds
;;; 5 - Buffers & Tabs
;;; 6 - Telescope
;;; 7 - Indentation
;;; 8 - LSP


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 1 - Imports

(load "~/dotfiles/emacs/startup.el")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 2 - Packages

;;; Icons in minibuffer
;;; all-the-icons-install-fonts
(use-package all-the-icons)
(use-package all-the-icons-completion
    :init (add-hook 'marginalia-mode-hook
        #'all-the-icons-completion-marginalia-setup))

;;; Jump back after goto-definition
(use-package better-jumper
    :init (better-jumper-mode t))

;;; Startify
(use-package dashboard
    :init (dashboard-setup-startup-hook))

;;; Easymotion
(use-package eno)

;;; Emacs VI Layer
(use-package evil
    :init (evil-mode t))

;;; general-define-key
(use-package general)

;;; Theming
(use-package gruvbox-theme
    :init (load-theme 'gruvbox t))

;;; Add the discoverability
(use-package helpful)

;;; Add notes in M-x
(use-package marginalia
    :init (marginalia-mode t))

;;; Project search and navigation
(use-package projectile)

;;; Transparent Remote Access, Multiple Protocol
(use-package tramp)

;;; Undo as sane people understand it
(use-package undo-fu)

;;; Resize and navigate splits
(use-package windsize)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 3 - Defaults
;;; Some of this is from DOOM EMACS "better defaults"
;;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#better-defaults

(setq-default
    desktop-auto-save-timeout 60            ;;; Save desktop/workspace every x SECONDS
    frame-resize-pixelwise t                ;;; Enable this if there's empty space around the emacs' window while maximized
    message-log-max nil

    completion-tool "Vertico"               ;;; Helm, Selectrum, Vertico
    buffer-tabs     "Centaur"               ;;; Centaur
    use-tab-icons nil

    ad-redefinition-action 'accept          ;;; Silence warnings for redefinition
    auto-save-list-file-prefix nil          ;;; Prevent tracking for auto-saves
    cursor-in-non-selected-windows nil      ;;; Hide the cursor in inactive windows
    cursor-type '(hbar . 2)                 ;;; Underline-shaped cursor
    custom-unlispify-menu-entries nil       ;;; Prefer kebab-case for titles
    custom-unlispify-tag-names nil          ;;; Prefer kebab-case for symbols
    delete-by-moving-to-trash t             ;;; Delete files to trash
    fill-column 80                          ;;; Set width for automatic line breaks
    gc-cons-threshold (* 8 1024 1024)       ;;; We're not using Game Boys anymore
    help-window-select t                    ;;; Focus new help windows when opened
    indent-tabs-mode nil                    ;;; Stop using tabs to indent
    inhibit-startup-screen t                ;;; Disable start-up screen
    initial-scratch-message ""              ;;; Empty the initial *scratch* buffer
    mouse-yank-at-point t                   ;;; Yank at point rather than pointer
    recenter-positions '(5 top bottom)      ;;; Set re-centering positions
    scroll-conservatively 101               ;;; Avoid recentering when scrolling far
    scroll-margin 5                         ;;; Add a margin when scrolling vertically
    select-enable-clipboard t               ;;; Merge system's and Emacs' clipboard
    sentence-end-double-space nil           ;;; Use a single space after dots
    show-help-function nil                  ;;; Disable help text everywhere
    show-trailing-whitespace t
    tab-always-indent 'complete             ;;; Tab indents first then tries completions
    tab-width 4                             ;;; Smaller width for tab characters
    uniquify-buffer-name-style 'forward     ;;; Uniquify buffer names
    warning-minimum-level :error            ;;; Skip warning buffers
    window-combination-resize t             ;;; Resize windows proportionally
    x-stretch-cursor t)                     ;;; Stretch cursor to the glyph width

    (set-frame-font "MesloLGS NF-12" nil t)
    ;; (set-frame-font "MesloLGS NF-13" nil t)
    ;; (set-frame-font "Hack Nerd Font Mono-13" nil t)

    (desktop-save-mode t)                   ;;; Offer to save desktop/workspace on exit; M-x: desktop-save; M-x: desktop-read
    (global-linum-mode t)                   ;;; Show line numbers
    (tool-bar-mode -1)                      ;;; Disable default GUI controls
    (menu-bar-mode -1)                      ;;; Disable File, Edit, ...
    (toggle-scroll-bar -1)                  ;;; Disable scrollbar

    (blink-cursor-mode 0)                   ;;; Prefer a still cursor
    (delete-selection-mode t)               ;;; Replace region when inserting text
    (fset 'yes-or-no-p 'y-or-n-p)           ;;; Replace yes/no prompts with y/n
    (global-subword-mode t)                 ;;; Iterate through camelCase words
    (mouse-avoidance-mode 'exile)           ;;; Avoid collision of mouse with point
    (put 'downcase-region 'disabled nil)    ;;; Enable downcase-region
    (put 'upcase-region 'disabled nil)      ;;; Enable upcase-region
    (set-default-coding-systems 'utf-8)     ;;; Default to utf-8 encoding
    (show-paren-mode t)                     ;;; Highlight paren/bracket pairs


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 - Keybinds
;;; https://github.com/noctuid/general.el
;;; https://evil.readthedocs.io/en/latest/keymaps.html

(general-define-key
    ;;; Global map and all states by default
    "M-d"      'find-file
    "C-h c"    'helpful-command
    "C-h k"    'helpful-key
    "C-h m"    'describe-mode
    "C-q"      'save-buffers-kill-terminal
    "<escape>" 'keyboard-escape-quit)

(general-define-key
    ;; :keymaps '(global Buffer-menu-mode-map)
    :states  '(normal visual motion emacs)
    "SPC"    'evil-send-leader
    ";"      'evil-ex
    "h"      'evil-insert
    "H"      'evil-insert-line
    "M-p"    'projectile-find-file
    "gd"     'lsp-find-definition
    "M-b"    'switch-to-buffer
    "<leader>b" 'switch-to-buffer
    ;;; Vim movement
    "i"      'evil-previous-visual-line
    "k"      'evil-next-visual-line
    "j"      'evil-backward-char
    "l"      'evil-forward-char
    "s"      'eno-word-goto
    "C-i"    'evil-scroll-up
    "C-k"    'evil-scroll-down
    ;;; Undo + redo
    "u"      'undo-fu-only-undo
    "C-r"    'undo-fu-only-redo
    ;;; Back + forward
    "<"      'better-jumper-jump-backward
    ">"      'better-jumper-jump-forward
    ;;; Delete windows
    "C-w"    'kill-this-buffer
    "M-w"    'evil-window-delete
    ;;; Create splits
    "M-u"    (lambda() (interactive) (evil-window-split)  (other-window t))
    "M-s"    (lambda() (interactive) (evil-window-vsplit) (other-window t))
    ;;; Navigate splits
    "M-i"    'windmove-up
    "M-k"    'windmove-down
    "M-j"    'windmove-left
    "M-l"    'windmove-right
    ;;; Resize splits
    "M-W"    'windsize-up
    "M-S"    'windsize-down
    "M-A"    'windsize-left
    "M-D"    'windsize-right)

(general-define-key
    :states      'normal
    "M-/"        'comment-line
    "Y"          'evil-yank-to-eol
    "I"          (lambda() (interactive) (evil-move-line -1))
    "K"          (lambda() (interactive) (evil-move-line +1))
    "C-v"        'evil-paste-after
    "<tab>"      'evil-shift-right-line
    "<backtab>"  'evil-shift-left-line
    "<leader>t"  'test
    "<leader>ca" 'replace-word)

(general-define-key
    :states     'insert
    "j"         'maybe-exit
    "C-v"       'evil-paste-before
    "M-j"       'left-char
    "M-l"       'right-char
    "M-i"       'evil-previous-visual-line
    "M-k"       'evil-next-visual-line
    "<M-DEL>"   'evil-delete-backward-word
    "<tab>"     'evil-shift-right-line
    "<backtab>" 'evil-shift-left-line)

(general-define-key
    :states     'visual
    "I"         (lambda() (interactive) (evil-move-region -1) (evil-visual-restore t))
    "K"         (lambda() (interactive) (evil-move-region +1) (evil-visual-restore t))
    "M-/"       'comment-region
    "<tab>"     'evil-indent-region
    "<backtab>" 'evil-dedent-region)

(general-define-key
    :keymaps 'package-menu-mode-map
    "n"      'evil-search-next
    "N"      'evil-search-previous
    "/"      'evil-search-forward)

(general-define-key
    :keymaps 'lsp-mode-map
    "<f12>"  'lsp-find-definition)

(general-define-key
    :keymaps   'company-active-map
    "M-i"      'company-select-previous
    "M-k"      'company-select-next
    "<tab>"    'company-complete
    "<escape>" 'company-abort)

(general-define-key
    :keymaps 'minibuffer-mode-map
    "M-J"    'evil-backward-word-begin
    "M-L"    'evil-forward-word-begin)

(defun test ()
    (interactive)
    (print (line-number-at-pos)))

(defun replace-word (str)
    (interactive "sNew string: ")
    (let ((word (thing-at-point 'word 'no-properties)))
        (save-excursion
            (goto-char 0)
            (replace-string word str))))

(defun evil-yank-to-eol ()
    "Copy current position to end of line."
    (interactive)
    (evil-delete-line nil nil)
    (evil-undo 0))

(defun evil-move-line (n)
    (interactive)
    (evil-visual-line)
    (evil-move-region n))

(defun evil-move-region (n)
    "Move region N lines down."
    (interactive)
    (setq dir (if (> n 0)
        evil-visual-end
        evil-visual-beginning))
    (evil-move
        evil-visual-beginning
        evil-visual-end
        (+ n -1 (line-number-at-pos dir))))

(defun evil-indent-region ()
    "Shift region right. Retains selection."
    (interactive)
    (evil-shift-right evil-visual-beginning evil-visual-end)
    (evil-visual-restore t))

(defun evil-dedent-region ()
    "Shift region left. Retains selection."
    (interactive)
    (evil-shift-left evil-visual-beginning evil-visual-end)
    (evil-visual-restore t))

(evil-define-command maybe-exit ()
    "Exit INSERT mode with jk"
    :repeat change
    (interactive)
    (let ((modified (buffer-modified-p)))
        (insert "j")
        (let ((evt (read-event "Press k to leave INSERT mode" nil 0.5))) (cond
            ((null evt) (message ""))
            ((and (integerp evt) (char-equal evt ?k))
                (delete-char -1)
                (set-buffer-modified-p modified)
                (push 'escape unread-command-events))
            (t (setq unread-command-events (append unread-command-events (list evt))))))))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 5 - Buffers & Tabs

(pcase buffer-tabs
    ("Centaur" ()
        (use-package centaur-tabs)
        (centaur-tabs-mode t)
        (centaur-tabs-change-fonts "arial" 120)
        (centaur-tabs-headline-match)

        (general-define-key
            :states '(normal visual motion emacs)
            "C-j"   'centaur-tabs-backward
            "M-J"   'centaur-tabs-move-current-tab-to-left
            "C-l"   'centaur-tabs-forward
            "M-L"   'centaur-tabs-move-current-tab-to-right)

        (defun centaur-tabs-hide-tab (x)
            "Do no to show buffer X in tabs. Whitelist overrides blacklist."
            (let ((name (format "%s" x))) (and
                ;;; Whitelist
                (not (or
                    (string-equal "*dashboard*" name)
                    (string-equal "*Packages*" name)
                    (string-equal "*eshell*" name)
                    (string-equal "*ielm*" name)
                    (string-prefix-p "*magit" name)
                    (string-prefix-p "*Scratch" name)
                ))
                ;;; Blacklist
                (or
                    ;;; Current window is not dedicated window
                    (window-dedicated-p (selected-window))

                    ;;; Is not a magit buffer
                    ;; (and (string-prefix-p "magit" name) (not (file-name-extension name)

                    (string-prefix-p "*" name)
                    (string-prefix-p "markdown-code-fontification" name)))))

        (setq
            centaur-tabs-height 32
            centaur-tabs-style "bar"
            centaur-tabs-set-bar 'over
            centaur-tabs-set-close-button nil
            centaur-tabs-set-icons use-tab-icons
            centaur-tabs-set-modified-marker t)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 6 - Telescope (I wish)

(pcase completion-tool
    ("Helm" ()
        (use-package helm :init (helm-mode t))

        (global-set-key (kbd "M-x") 'helm-M-x)

        (general-define-key
            :keymaps '(helm-map helm-read-file-map)
            "M-i"    'helm-previous-line
            "M-k"    'helm-next-line
            "M-j"    'helm-find-files-up-one-level
            "M-l"    'helm-execute-persistent-action
            "<tab>"  'helm-execute-persistent-action)

        (general-define-key
            :states     '(normal visual motion emacs)
            "<leader>b" 'helm-buffers-list)

        (setq helm-boring-buffer-regexp-list (list
            (rx "*")
            (rx "markdown-code-fontification")))

        (setq helm-split-window-inside-p t
            helm-autoresize-max-height 0
            helm-autoresize-min-height 20))

    ("Selectrum" ()
        (use-package selectrum
            :init (selectrum-mode t))

        ;;; Fuzzy-match completion style (IE "foo bar" matches "foo-bar")
        (use-package selectrum-prescient
            :init (selectrum-prescient-mode t))

        (general-define-key
            :keymaps 'selectrum-minibuffer-map
            "M-w"    'kill-buffer
            "M-i"    'selectrum-previous-candidate
            "M-k"    'selectrum-next-candidate))

    ("Vertico" ()
        ;;; VERTical Interactive COmpletion
        (use-package vertico :init (vertico-mode t))

        ;;; Fuzzy-match completion style (IE "foo bar" matches "foo-bar")
        (use-package orderless)

        (setq
            vertico-scroll-margin 2
            vertico-resize 0
            vertico-count 10
            completion-styles '(orderless basic)
            completion-category-defaults nil
            completion-category-overrides '((file (styles partial-completion))))

        (general-define-key
            :keymaps 'vertico-map
            "M-w"    'kill-buffer
            "M-i"    'vertico-previous
            "M-k"    'vertico-next)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 7 - Indentation

;;; Guesses indentation offset
(use-package dtrt-indent
    :init (setq dtrt-indent-global-mode t))

;; (straight-use-package '(dtrt-indent
;;     :type git
;;     :host github
;;     :repo "jscheid/dtrt-indent"
;;     :init (dtrt-indent-global-mode t)))

;; (general-define-key
;;     :keymaps    '(python-mode-map)
;;     :states     '(normal insert visual)
;;     "<tab>"     'python-indent-shift-right
;;     "<backtab>" 'python-indent-shift-left)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 8 - Language Server Protocols (LSP)
;;; M-x and toggle language-mode to restart LSP
;;; https://emacs-lsp.github.io/lsp-mode/page/languages

(use-package company)
(use-package dap-mode)
(use-package go-mode)
(use-package nim-mode)
(use-package nix-mode)
(use-package lua-mode)
(use-package lsp-mode)
(use-package lsp-ui)
(use-package yaml)
(use-package yasnippet)
(use-package zig-mode)

(use-package lsp-python-ms
    :init (setq lsp-python-ms-executable
            (executable-find "python-language-server")))

;;; LSP settings
;; (add-hook 'after-init-hook 'global-company-mode)
;; (setq lsp-lens-enable t)
;; (setq lsp-diagnostics-provider :none)
;; (setq lsp-enable-snippet nil)

;; Company settings
;; (setq company-idle-delay 0)
;; (setq company-minimum-prefix-length 1)
;; (add-to-list 'company-backends 'company-yasnippet)

;;; Golang (gopls)
(add-hook 'go-mode-hook #'go-hooks)
(defun go-hooks()
    (setq lsp-enable-snippet t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))

;;; Nim
(add-hook 'nim-mode-hook #'nim-hooks)
(defun nim-hooks()
    (setq lsp-enable-snippet nil)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))

;;; Ruby (solargraph)
(add-hook 'ruby-mode-hook #'ruby-hooks)
(defun ruby-hooks()
    (setq lsp-enable-snippet t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))

;;; Python
(add-hook 'python-mode-hook #'python-hooks)
(defun python-hooks()
    (setq lsp-enable-snippet t)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))
