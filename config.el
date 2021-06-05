;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Youcef Maâmra"
      user-mail-address "maamra.youcef@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Iosevka SS07" :size 13)
      doom-unicode-font (font-spec :family "Hack Nerd Font"))
;;(setq doom-unicode-font "MesloLGS NF")
;; (setq doom-unicode-font (font-spec :family "Hack Nerd Font"))
;; change the line spacing for better visualization
(setq-default line-spacing 4)
(set-language-environment "UTF-8")
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
;; activate word wrap
(+global-word-wrap-mode +1)
(global-prettify-symbols-mode +1)
;; change the key modifiers on mac os
(setq mac-command-modifier 'meta)
(setq mac-option-modifier nil)
;; Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-horizon)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; custom functions
(defun cyuss--org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! ace-window
  :config
  (bind-key* "M-p" 'ace-window))

(use-package! all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1)
  :config
  (setq inhibit-compacting-font-caches t)
  )

(use-package! ivy-rich
  :init (ivy-rich-mode 1))

(use-package! zoom-window
  :config
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  (custom-set-variables '(zoom-window-mode-line-color "DarkCyan")))

(use-package! iedit
  :diminish iedit-mode
  :bind ("C-'" . iedit-mode))

(use-package! ace-jump-mode
  :bind (("C-c SPC" . ace-jump-mode)))

(use-package! discover-my-major
  :bind ("C-h C-m" . discover-my-major))

(use-package! ace-mc
  :bind (("C-)" . ace-mc-add-multiple-cursors)
         ("C-M-)" . ace-mc-add-single-cursor)))

(use-package! multiple-cursors
  :bind (("C-c k" . mc/edit-lines)
         ("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c m" . mc/mark-all-like-this)))

(use-package! rainbow-delimiters
  :config
  (add-hook 'python-mode-hook 'rainbow-identifiers-mode)
   (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face))

(use-package! elpy
  :after python
  :init
  (advice-add 'python-mode :before 'elpy-enable)
  ;; (setq-default elpy-company-post-completion-function 'elpy-company-post-complete-parens)
  (add-hook 'python-mode-hook (lambda ()
                                (flymake-mode -1)
                                (flycheck-mode -1)
                                (poetry-tracking-mode)
                                (highlight-indentation-mode -1))))

(use-package! poetry
  :after python
  :init
  (setq-default poetry-tracking-strategy 'projectile))

(use-package! comment-dwim-2
  :bind ("C-," . comment-dwim-2)
  :config (setq comment-dwim-2--inline-comment-behavior 'reindent-comment))
