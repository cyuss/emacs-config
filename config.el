;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Youcef"
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
;;       "Iosevka SS07"
(setq doom-font (font-spec :family "Roboto Mono" :size 13)
      doom-unicode-font (font-spec :family "MesloLGS NF"))
;; Menlo, Monaco, 'Courier New', monospace, MesloLGS NF
;;(setq doom-unicode-font "MesloLGS NF")
;; (setq doom-unicode-font (font-spec :family "Hack Nerd Font"))
;; splash screen
(setq fancy-splash-image "~/.doom.d/misc/img/logo.png")
;; change the line spacing for better visualization
(setq-default line-spacing 7)
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
(setq mac-option-modifier 'nil)
;; Start maximised (cross-platf)
(add-hook 'window-setup-hook 'toggle-frame-maximized t)
;; org related config
(custom-set-variables ;; show logbook drawer for historical logs
 '(org-log-into-drawer t))
;; python related conf
(setq-default poetry-tracking-strategy 'projectile)
(add-hook 'python-mode-hook (lambda ()
                              (flymake-mode -1)
                              (flycheck-mode -1)))

;; disable lsp pyls warnings
(setq lsp-pyls-plugins-pycodestyle-enabled nil)

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-ayu-light)
(setq doom-theme 'doom-horizon)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dropbox/Org/"
      org-roam-directory "~/Dropbox/Org/Roam/")
;; (setq-default org-display-custom-times t)
;; (setq org-time-stamp-custom-formats
;;       '("<%d-%m-%Y" . "<%d-%m-%Y %H:%M>"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(global-set-key (kbd "C-s") 'swiper)

;; custom functions
(defun cyuss--org-add-ids-to-headlines-in-file ()
  "Add ID properties to all headlines in the current file which do not already have one."
  (interactive)
  (org-map-entries 'org-id-get-create))

;; latex config
(setq org-latex-to-pdf-process (list "latexmk -pdf %f"))


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

;; (after! org
;;   (setq org-tags-column -80))

(use-package! zoom)

(use-package! ace-window
  :config
  (bind-key* "M-p" 'ace-window))

(use-package! all-the-icons-ivy-rich
  :init (all-the-icons-ivy-rich-mode 1)
  :config
  (setq inhibit-compacting-font-caches t))

(use-package! ivy-rich
  :init (ivy-rich-mode 1))

(use-package! zoom-window
  :config
  (global-set-key (kbd "C-x C-z") 'zoom-window-zoom)
  :custom
  (custom-set-variables '(zoom-window-mode-line-color "plum4")))

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
         ("C-x m" . mc/mark-all-like-this)))

;; (use-package! rainbow-delimiters
;;   :config
;;   ;; (add-hook 'python-mode-hook 'rainbow-identifiers-mode)
;;   (setq rainbow-identifiers-choose-face-function 'rainbow-identifiers-cie-l*a*b*-choose-face))

(use-package! comment-dwim-2
  :bind ("C-," . comment-dwim-2)
  :config (setq comment-dwim-2--inline-comment-behavior 'reindent-comment))

(use-package! org-fragtog
  :after org
  :hook (org-mode . org-fragtog-mode))

(use-package! org-edna
  :after org
  :hook (org-mode . org-edna-mode))

(use-package! org-tree-slide
  :custom
  (org-image-actual-width nil))

(use-package! org-fancy-priorities
  :diminish
  :ensure t
  :hook (org-mode . org-fancy-priorities-mode)
  :config
  (setq org-fancy-priorities-list '("🅰" "🅱" "🅲" "🅳" "🅴")))

(add-hook 'org-mode-hook (lambda ()
                           "Beautify Org Checkbox Symbol"
                           ;; (push '("[ ]" . "☐") prettify-symbols-alist)
                           (push '("[X]" . "☑" ) prettify-symbols-alist)
                           (push '("[-]" . "❍" ) prettify-symbols-alist)
                           (push '("#+BEGIN_SRC" . "↦" ) prettify-symbols-alist)
                           (push '("#+END_SRC" . "⇤" ) prettify-symbols-alist)
                           (push '("#+BEGIN_EXAMPLE" . "↦" ) prettify-symbols-alist)
                           (push '("#+END_EXAMPLE" . "⇤" ) prettify-symbols-alist)
                           (push '("#+BEGIN_QUOTE" . "↦" ) prettify-symbols-alist)
                           (push '("#+END_QUOTE" . "⇤" ) prettify-symbols-alist)
                           (push '("#+begin_quote" . "↦" ) prettify-symbols-alist)
                           (push '("#+end_quote" . "⇤" ) prettify-symbols-alist)
                           (push '("#+begin_example" . "↦" ) prettify-symbols-alist)
                           (push '("#+end_example" . "⇤" ) prettify-symbols-alist)
                           (push '("#+begin_src" . "↦" ) prettify-symbols-alist)
                           (push '("#+end_src" . "⇤" ) prettify-symbols-alist)
                           (prettify-symbols-mode)))

;; (use-package! svg-tag-mode
;;   :config
;;   (load-file "~/.doom.d/misc/svg-config.el"))

(use-package! focus
  :config
  '((prog-mode . defun) (text-mode . sentence)))

(use-package! info-colors
  :commands (info-colors-fontify-node)
  :config
  (add-hook 'Info-selection-hook 'info-colors-fontify-node))

;; Set up org-ref stuff
(use-package! org-ref
  :custom
  (org-ref-default-bibliography "~/Zotero/better-bibtex/library.bib")
  :config
  (setq bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
        bibtex-completion-notes-template-multiple-files
        "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n")
  (define-key org-mode-map (kbd "C-c n b") 'org-ref-insert-cite-link)
  (define-key org-mode-map (kbd "M-[") 'org-ref-insert-link-hydra/body)
  )

(use-package! ivy-bibtex
  :init
  (setq bibtex-completion-bibliography "~/Zotero/better-bibtex/library.bib"
        bibtex-completion-additional-search-fields '(keywords)
        org-ref-insert-link-function 'org-ref-insert-link-hydra/body
        org-ref-insert-cite-function 'org-ref-cite-insert-ivy
        org-ref-insert-label-function 'org-ref-insert-label-link
        org-ref-insert-ref-function 'org-ref-insert-ref-link
        org-ref-cite-onclick-function (lambda (_) (org-ref-citation-hydra/body))
        )
  )

;; elfeed
(global-set-key (kbd "C-x w") 'elfeed)

(use-package! websocket
  :after org-roam)

(use-package! org-roam-ui
  :after org-roam ;; or :after org
  ;; normally we'd recommend hooking orui after org-roam, but since org-roam does not have
  ;; a hookable mode anymore, you're advised to pick something yourself
  ;;         if you don't care about startup time, use
  ;; :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))
