;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CONTENTS

;;; 1 - IMPORTS
;;; 2 - PACKAGES
;;; 3 - EMACS DEFAULTS
;;; 4 - GLOBAL KEYS
;;; 5 - CENTAUR TABS
;;; 6 - DIRED, HELM, IVY
;;; 7 - EVIL
;;; 8 - FLYCHECK, FLYMAKE
;;; 9 - INDENTATION


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 1 - IMPORTS

(load "~/dotfiles/emacs/house-keeping.el")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 2 - PACKAGES

(use-package ace-jump-mode)    ;;; Fast and precise keyboard navigation
(use-package better-jumper     :init (better-jumper-mode 1))
(use-package centaur-tabs      :init (centaur-tabs-mode 1))     ;;; Display a tab for each buffer
(use-package dap-mode)
;; (use-package doom-modeline     :init (doom-modeline-mode 1))    ;;; The bar at the bottom of the screen
(use-package elpy)
(use-package evil              :init (evil-mode 1))             ;;; Emacs VI Layer
;; (use-package fzf)
(use-package general)                                           ;;; general-define-key
(use-package gruvbox-theme     :init (load-theme 'gruvbox 1))   ;;; Color scheme
(use-package helm              :init (helm-mode 1) (defvar using-helm 1))  ;;; Smart search
(use-package helm-describe-modes)
(use-package lua-mode)
(use-package lsp-mode)
(use-package lsp-ui)
(use-package magit)
(use-package nix-mode)
(use-package undo-fu)
(use-package windsize)
(use-package yaml)
(use-package zig-mode)

(straight-use-package '(dtrt-indent
    :type git
    :host github
    :repo "jscheid/dtrt-indent"
    :init (dtrt-indent-global-mode 1)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 3 - EMACS DEFAULTS
;;; Some of this is from DOOM EMACS "better defaults"
;;; https://github.com/angrybacon/dotemacs/blob/master/dotemacs.org#better-defaults

(setq-default
    default-frame-alist '((font . "MesloLGM Nerd Font Mono-13"))
    desktop-auto-save-timeout 30            ;;; Save desktop/workspace every x SECONDS
    frame-resize-pixelwise t                ;;; Enable this if there's empty space around the emacs' window while maximized
    message-log-max nil
    mac-command-modifier 'meta
   
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
    tab-always-indent 'complete             ;;; Tab indents first then tries completions
    tab-width 4                             ;;; Smaller width for tab characters
    uniquify-buffer-name-style 'forward     ;;; Uniquify buffer names
    warning-minimum-level :error            ;;; Skip warning buffers
    window-combination-resize t             ;;; Resize windows proportionally
    x-stretch-cursor t)                     ;;; Stretch cursor to the glyph width

    (desktop-save-mode t)                   ;;; Offer to save desktop/workspace on exit; M-x: desktop-save; M-x: desktop-read
    (global-linum-mode t)                   ;;; Show line numbers
    (tool-bar-mode -1)                      ;;; Disable default GUI controls
    (menu-bar-mode -1)                      ;;; Disable File, Edit, ...
    (toggle-scroll-bar -1)                  ;;; Disable scrollbar

    (blink-cursor-mode 0)                   ;;; Prefer a still cursor
    (delete-selection-mode 1)               ;;; Replace region when inserting text
    (fset 'yes-or-no-p 'y-or-n-p)           ;;; Replace yes/no prompts with y/n
    (global-subword-mode 1)                 ;;; Iterate through camelCase words
    (mouse-avoidance-mode 'exile)           ;;; Avoid collision of mouse with point
    (put 'downcase-region 'disabled nil)    ;;; Enable downcase-region
    (put 'upcase-region 'disabled nil)      ;;; Enable upcase-region
    (set-default-coding-systems 'utf-8)     ;;; Default to utf-8 encoding
    (show-paren-mode 1)                     ;;; Highlight paren/bracket pairs


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 - GLOBAL KEYS

(general-define-key
    ;;; Global map and all states by default
    "C-h e"    'discover-my-mode
    "<escape>" 'keyboard-escape-quit)

(general-define-key
    :states      '(normal visual motion emacs)
    "C-j"        'centaur-tabs-backward
    "C-l"        'centaur-tabs-forward
    "M-u"        (lambda() (interactive) (evil-window-split)  (other-window 1))
    "M-s"        (lambda() (interactive) (evil-window-vsplit) (other-window 1))
    "<leader>jb" 'better-jumper-jump-backward
    "<leader>jf" 'better-jumper-jump-forward
    "<leader>b"  'helm-buffers-list
    ;; "<leader>b"  'helm-mini
    ;; "C-w"        'kill-this-buffer
    "C-w"        'kill-buffer-and-window
    "M-w"        'evil-window-delete
    "SPC"        'evil-send-leader
    ;;; Navigate splits
    "M-i"        'windmove-up
    "M-k"        'windmove-down
    "M-j"        'windmove-left
    "M-l"        'windmove-right
    ;;; Resize splits
    "M-I"        'windsize-up
    "M-K"        'windsize-down
    "M-J"        'windsize-left
    "M-L"        'windsize-right)

(general-define-key
    :keymaps 'package-menu-mode-map
    "n"      'evil-search-next
    "N"      'evil-search-previous
    "/"      'evil-search-forward)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 5 - CENTAUR TABS
;;; https://github.com/ema2159/centaur-tabs

(centaur-tabs-change-fonts "arial" 120)
(centaur-tabs-headline-match)

(setq
    centaur-tabs-height 32
    centaur-tabs-style "bar"
    centaur-tabs-set-bar 'over
    centaur-tabs-set-close-button nil
    centaur-tabs-set-icons t
    centaur-tabs-set-modified-marker t)

(defun centaur-tabs-hide-tab (x)
    "Do no to show buffer X in tabs. Whitelist overrides blacklist."
    (let ((name (format "%s" x))) (and
        ;; Whitelist
        (not (or
            (string-prefix-p "*magit" name)))
        
        ;; Blaclist
        (or
            ;; Current window is not dedicated window.
            (window-dedicated-p (selected-window))
            
            ;; Is not magit buffer.
            ;; (and (string-prefix-p "magit" name) (not (file-name-extension name)
            
            ;; Buffer name not match below blacklist.
            (string-prefix-p "*" name)
            (string-prefix-p "markdown-code-fontification" name)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 6 - DIRED, HELM, IVY

(global-set-key (kbd "M-d") 'find-file-existing)

(when (ignore-errors using-helm)
    (global-set-key (kbd "M-x") 'helm-M-x)
    
    (setq helm-boring-buffer-regexp-list (list
        (rx "*")            
        (rx "markdown-code-fontification")))
    
    (setq helm-split-window-inside-p t
        helm-autoresize-max-height 0
        helm-autoresize-min-height 20))

(general-define-key
    :keymaps      '(helm-map helm-read-file-map)
    "C-h m"       'describe-mode
    "C-j"         'helm-find-files-up-one-level
    "C-i"         'helm-previous-line
    "C-k"         'helm-next-line
    "C-l"         'helm-execute-persistent-action
    "<tab>"       'helm-execute-persistent-action)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;z
;;; 7 - EVIL
;;; https://evil.readthedocs.io/en/latest/keymaps.html

(evil-set-leader 'normal (kbd "SPC"))

;;; NORMAL
(evil-global-set-key 'normal      ";"          'evil-ex)
(evil-global-set-key 'normal      "h"          'evil-insert)
(evil-global-set-key 'normal (kbd "<tab>")     'evil-shift-right-line)
(evil-global-set-key 'normal (kbd "<backtab>") 'evil-shift-left-line)
;;; INSERT
(evil-global-set-key 'insert      "j"          'maybe-exit)
(evil-global-set-key 'insert (kbd "C-j")       'left-char)
(evil-global-set-key 'insert (kbd "C-l")       'right-char)
(evil-global-set-key 'insert (kbd "C-i")       'evil-previous-line)
(evil-global-set-key 'insert (kbd "C-k")       'evil-next-line)
(evil-global-set-key 'insert (kbd "C-k")       'evil-next-line)
(evil-global-set-key 'insert (kbd "<C-SPC>")   (lambda() (interactive) (insert " ")))
(evil-global-set-key 'insert (kbd "<M-DEL>")   'evil-delete-backward-word)
(evil-global-set-key 'insert (kbd "<tab>")     'evil-shift-right-line)
(evil-global-set-key 'insert (kbd "<backtab>") 'evil-shift-left-line)
;;; VISUAL
(evil-global-set-key 'visual (kbd "<tab>")     'my-evil-indent-region)
(evil-global-set-key 'visual (kbd "<backtab>") 'my-evil-dedent-region)
;;; MULTIPLE MODES
(general-define-key
    :keymaps '(global dired-mode-map)
    :states  '(normal visual motion emacs)
    "i"      'evil-previous-line
    "j"      'evil-backward-char
    "k"      'evil-next-line
    "s"      'evil-ace-jump-char-mode
    "u"      'undo-fu-only-undo
    "C-/"    'comment-line
    "C-i"    'evil-scroll-up
    "C-k"    'evil-scroll-down
    "C-r"    'undo-fu-only-redo)


(defun my-evil-indent-region()
    "Shift selected region right. Retains selection."
    (interactive)
    (evil-shift-right evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))

(defun my-evil-dedent-region()
    "Shift selected region left. Retains selection."
    (interactive)
    (evil-shift-left evil-visual-beginning evil-visual-end)
    (evil-normal-state)
    (evil-visual-restore))

(evil-define-command maybe-exit()
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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 8 - FLYCHECK, FLYMAKE

;; (setq flycheck-check-syntax-automatically '(mode-enabled save)) ;;; Only lint on save or emacs will lag
;; (setq flycheck-python-flake8-executable "flake8") ;;; Give it the absolute path to your flake8 binary if it's not on your $PATH


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 9 - INDENTATION
;;; dtrt-indent should already be inferring indentation
;;; enable this (or find a better package for indentation detection) if it doesn't work in a given mode

; (general-define-key
;     :keymaps    '(python-mode-map)
;     :states     '(normal insert visual)
;     "<tab>"     'python-indent-shift-right
;     "<backtab>" 'python-indent-shift-left)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 10 - Language Server Protocols (LSP)
;;; Dependencies: Company, YASnippets, Flymake
;;; M-x and re-enable language-mode to restart LSP

;;; LSP settings
(setq lsp-lens-enable 1)
(setq lsp-diagnostics-provider :none)
;; (setq lsp-enable-snippet nil)

;;; Company settings
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;;; Keybinds
(general-define-key
    :keymaps    'company-active-map
    "<tab>"     'company-complete
    "C-i"     'company-select-previous-or-abort
    "C-k"     'company-select-next-or-abort)

(general-define-key
    :keymaps 'lsp-mode-map
    "<f12>"  'lsp-find-definition)

;;; Golang (gopls)
(add-hook 'go-mode-hook #'go-hooks)
(defun go-hooks()
    (setq lsp-enable-snippet nil)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))

;;; Ruby (solargraph)
(add-hook 'ruby-mode-hook #'ruby-hooks)
(defun ruby-hooks()
    (setq lsp-enable-snippet 1)
    (add-hook 'before-save-hook #'lsp-organize-imports t t)
    (add-hook 'before-save-hook #'lsp-format-buffer t t)
    (lsp-deferred))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; END

(provide 'init.el)
