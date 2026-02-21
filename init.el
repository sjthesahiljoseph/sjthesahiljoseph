
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq use-dialog-box nil)
(setq echo-keystrokes nil)
(global-hl-line-mode 0)
(global-display-line-numbers-mode 1)
(column-number-mode t)
(when (bound-and-true-p tooltip-mode)
    (tooltip-mode -1))

(global-subword-mode t)

(add-to-list 'default-frame-alist '(fullscreen . maximized))

(split-window-horizontally)

(setq-default cursor-type 'box)

(set-cursor-color "#40ff40")

(blink-cursor-mode 1)
(setq blink-cursor-blinks 0)
(setq blink-cursor-interval 0.5)
(setq highlight-nonselected-windows t)
(setq-default cursor-in-non-selected-windows t)

(setq-default word-wrap t)
(setq-default truncate-lines t)

(setq enable-recursive-minibuffers nil)
(setq truncate-partial-width-windows nil)
(setq sentence-end-double-space nil)
(setq require-final-newline nil)

(setq-default scroll-margin 1)
(setq scroll-conservatively 101)

(setq window-divider-default-right-width 0)
(setq window-divider-default-left-width 0)
(setq window-divider-default-bottom-width 0)

(set-frame-font "Liberation Mono 13" nil t)

(setq frame-title-format '("SJ the Sahil Joseph's Writing System"))

(setq window-icon-file "C:/Users/sjthe/Projects/sjthesahiljoseph/sjthesahiljoseph/emacs_icon.ico")

(modify-all-frames-parameters `((icon-type . ,window-icon-file)))

(add-to-list 'custom-theme-load-path "C:/Users/sjthe/Projects/loveisanillusion.emacs")
(load-theme 'loveisanillusion.emacs t)

(setq inhibit-startup-message t)
(setq inhibit-message t)
(set-message-beep 'silent)
(setq initial-scratch-message "\
;; SJ the Sahil Joseph

")

(transient-mark-mode 1)

(setq mark-even-if-inactive nil)

(setq-default compilation-always-kill t)
(setq-default compilation-scroll-output t)

(defun run-build-script ()
	"Run the build.bat."
	(interactive)
	(compile "build.bat"))

(setq auto-save-default nil)
(setq make-backup-files nil)

(global-auto-revert-mode 1)
(setq global-auto-revert-non-file-buffers t)
(setq auto-revert-verbose nil)
(setq auto-revert-use-notify t)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu"   . "https://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org"   . "https://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(setq url-queue-timeout 30)

(unless (package-installed-p 'use-package)
	(package-refresh-contents)
	(package-install 'use-package))

(eval-and-compile
	(setq use-package-always-ensure t
        use-package-expand-minimally t
        warning-minimum-level :error))

(use-package cc-mode
	:ensure t
    :defer t
    )

(use-package colorful-mode
	:ensure t
	:custom
	(colorful-use-prefix t)
	(colorful-only-strings 'only-prog)
	(css-fontify-colors nil)
	:config
	(global-colorful-mode t)
	(add-to-list 'global-colorful-modes 'helpful-mode))

(use-package python-mode
	:ensure t
    :defer t
    )

(use-package markdown-mode
	:ensure t
    :defer t
    )

(use-package json-mode
    :ensure t
    :defer t
    )

(use-package web-mode
    :ensure t
    :defer t
    :mode
    (
        ("\\.html\\'" . web-mode)
        ("\\.css\\'" . web-mode)
        )
    :config
    )

(use-package emmet-mode
    :ensure t
    :defer t
    )

(add-hook 'web-mode-hook 'emmet-mode)

(defun my-web-mode-hook ()
    "Hooks for Web mode."
    (setq web-mode-markup-indent-offset 4)
    (setq web-mode-css-indent-offset 4)
    (setq web-mode-code-indent-offset 4)
    (setq web-mode-enable-auto-pairing nil)
    (setq web-mode-enable-auto-closing nil)
    (setq web-mode-enable-auto-indentation nil)
    (setq web-mode-enable-auto-opening nil)
    (setq web-mode-enable-auto-quoting  nil)
    )

(add-hook 'web-mode-hook  'my-web-mode-hook)

(setq create-lockfiles nil)

(setq eldoc-echo-area-use-multiline-p nil)

(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

(setq electric-indent-mode t)
(setq-default indent-tabs-mode t)
(setq-default tab-width 4)
(setq-default tab-always-indent t)
(setq backward-delete-char-untabify-method 'hungry)
(setq-default electric-indent-inhibit t)

(setq c-basic-offset 4)
(setq lisp-indent-offset 4)
(setq-default js-indent-level 4)
(setq-default typescript-indent-level 4)
(setq c-default-style "linux")
(setq-default c-indent-level 4)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
    (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
    (define-key dired-mode-map (kbd "/") 
        (lambda () (interactive) (find-alternate-file "..")))
    )

(defun indent-whole-buffer ()
    "Indent the entire buffer."
    (interactive)
    (indent-region (point-min) (point-max)))

(setq isearch-lazy-highlight nil)

(global-set-key (kbd "M-1")
    (lambda ()
        (interactive)
        (point-to-register ?1)
        (message "Saved position to register 1")))

(global-set-key (kbd "M-2")
    (lambda ()
        (interactive)
        (point-to-register ?2)
        (message "Saved position to register 2")))

(global-set-key (kbd "M-3")
    (lambda ()
        (interactive)
        (point-to-register ?3)
        (message "Saved position to register 3")))

(global-set-key (kbd "M-4")
    (lambda ()
        (interactive)
        (point-to-register ?4)
        (message "Saved position to register 4")))

(global-set-key (kbd "C-1")
    (lambda ()
        (interactive)
        (jump-to-register ?1)))

(global-set-key (kbd "C-2")
    (lambda ()
        (interactive)
        (jump-to-register ?2)))

(global-set-key (kbd "C-3")
    (lambda ()
        (interactive)
        (jump-to-register ?3)))

(global-set-key (kbd "C-4")
    (lambda ()
        (interactive)
        (jump-to-register ?4)))

(setq kill-do-not-save-duplicates t)
(setq save-interprogram-paste-before-kill nil)
(setq select-enable-clipboard t)

(defun suppress-kill-ring (orig-fun &rest args)
    "Prevent text from being saved to the kill-ring."
    (let ((kill-ring nil)
             (kill-ring-yank-pointer nil)
             (interprogram-cut-function nil))
        (apply orig-fun args)))

(advice-add 'kill-word :around #'suppress-kill-ring)
(advice-add 'backward-kill-word :around #'suppress-kill-ring)

(use-package move-text
    :ensure t
    )

(global-set-key (kbd "M-<up>") 'move-text-up)
(global-set-key (kbd "M-<down>") 'move-text-down)

(defun indent-region-advice (&rest ignored)
    (let ((deactivate deactivate-mark))
        (if (region-active-p)
            (indent-region (region-beginning) (region-end))
            (indent-region (line-beginning-position) (line-end-position)))
        (setq deactivate-mark deactivate)))

(advice-add 'move-text-down :after 'indent-region-advice)
(advice-add 'move-text-up :after 'indent-region-advice)

(global-set-key (kbd "<f1>") 'next-error)
(global-set-key (kbd "<f2>") 'previous-error)
(global-set-key (kbd "<f3>") 'kmacro-start-macro-or-insert-counter)
(global-set-key (kbd "<f4>") 'kmacro-end-and-call-macro)
(global-set-key (kbd "<f5>") 'run-build-script)
(global-set-key (kbd "<f6>") 'hl-line-mode)
(global-set-key (kbd "<f7>") 'query-replace)
(global-set-key (kbd "<f8>") 'eval-region)
(global-set-key (kbd "<f9>") #'visual-line-mode)
(global-set-key (kbd "<f10>") 'indent-whole-buffer)
(global-set-key (kbd "<f11>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<f12>") 'point-to-register)

(global-set-key (kbd "M-<return>") 'indent-whole-buffer)

(global-set-key (kbd "C-z") 'undo)
(global-set-key (kbd "C-S-z") 'undo-redo)

(global-set-key (kbd "<C-tab>") 'next-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'previous-buffer)
(global-set-key (kbd "<C-S-tab>") 'previous-buffer)

(defun my-duplicate-line-or-region ()
	(interactive)
	(let (p1 p2)
		(if (use-region-p)
			(setq p1 (region-beginning) p2 (region-end))
			(setq p1 (line-beginning-position) p2 (line-end-position)))
		(save-excursion
			(let ((text (buffer-substring p1 p2)))
				(goto-char p2)
				(newline)
				(insert text)))))

(global-set-key (kbd "C-d") 'my-duplicate-line-or-region)





(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
