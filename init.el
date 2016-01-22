; Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)


; save history of buffers
(savehist-mode t)

; save place of cursor in file
(setq-default save-place t)
(require 'saveplace)

; raise number of lines of log
(setq message-log-max 10000)

; raise number of histories
(setq history-length 10000)

; display key stroke quickly in echo area
(setq echo-keystrokes 0.1)

; display number of columns
(column-number-mode t)

; display size of file
(size-indication-mode t)


; swap meta key and super key
(setq ns-command-modifier (quote meta))
(setq ns-alternate-modifier (quote super))

; rectangle mark
(cua-mode t)
(setq cua-enable-cua-keys nil)
(define-key global-map (kbd "C-RET") 'cua-set-rectangle-mark)

(keyboard-translate ?\C-h ?\C-?)
(define-key global-map (kbd "C-c r") 'query-replace)
(define-key global-map (kbd "C-x ?") 'help-command)
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
(define-key global-map (kbd "C-t") 'other-window)
(define-key global-map (kbd "C-c c") 'comment-region)
(define-key global-map (kbd "C-c u") 'uncomment-region)
(define-key global-map (kbd "C-c a") 'align)
(define-key global-map (kbd "M-h") 'backward-kill-word)
(define-key global-map (kbd "M-g") 'goto-line)


; revert buffer automatically when file was changed
(global-auto-revert-mode t)

; set default encoding UTF-8 and default newline "LF" (UNIX-style)
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

; save backup and auto-save files in "~/.emacs.d/backups/"
(add-to-list 'backup-directory-alist
             (cons "." "~/.emacs.d/backups"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups") t)))

; turn off KKC
(global-set-key (kbd "C-\\") 'nil)

; change yes/no to y/n
(fset 'yes-or-no-p 'y-or-n-p)

; ignore cases of a character
(setq completion-ignore-case t)

; change the identifier of files that have same name
(when (require 'uniquify nil t)
  (setq uniquify-buffer-name-style 'post-forward-angle-brackets))

; configure wdired
(require 'dired)
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

; delete trailing whitespace before save file
(add-hook 'before-save-hook 'delete-trailing-whitespace)

; delete newline character at the end of the line when C-k
(setq kill-whole-line t)

; copy directory recursively
(setq dired-recursive-copies 'always)

; match only file name when do I-search in dired buffer
(setq dired-isearch-filenames t)


; set ascii font
(set-face-attribute 'default nil
                    :family "Menlo"
                    :height 140)

; set Hiragino Kaku Gothic ProN as Japanese set.
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Hiragino Kaku Gothic ProN"))

(setq default-tab-width 4)

(show-paren-mode t)
(set-face-background 'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "yellow")

; display highlight of parentheses quickly
(setq show-paren-delay 0)

(global-hl-line-mode nil)

; not display tool bar, menu bar and scroll bar
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

; configure transparence
(when window-system
  (set-frame-parameter nil 'alpha 90))

; show the function name where the cursor is in
(which-function-mode t)

(setq-default indicate-buffer-boundaries 'left)

(desktop-save-mode 1)


; Redo+
(when (require 'redo+ nil t)
 (global-set-key (kbd "C-.") 'redo))

; Color-moccur
(when (require 'color-moccur nil t)
  ;; Assign occur-by-moccur to M-o.
  (define-key global-map (kbd "M-o") 'occur-by-moccur)
  ;; Do AND search by space delimiter.
  (setq moccur-split-word t)
  ;; Ignore these file in directory search.
  (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
  (add-to-list 'dmoccur-exclusion-mask "^#.+#$"))

; Emacs theme
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-dark-laptop))

; Helm
(when (require 'helm-config nil t)
  (helm-mode 1)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c f") 'helm-for-files)
  (global-set-key (kbd "C-c y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-c s") 'helm-do-grep)
  (global-set-key (kbd "M-x") 'helm-M-x))

; auto-complete
(require 'auto-complete-config)
(ac-config-default)
(setq ac-use-menu-map t)

; yasnippet
(require 'yasnippet)
(setq yas-snippet-dirs
	  '("~/.emacs.d/snippets"
		"~/.emacs.d/elpa/yasnippet-20140427.1224/snippets"))
(yas-global-mode t)

; display buffer to create a new snippet
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)

; view / edit snippets
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)

; not use yas's popup prompt
(setq yas-prompt-function 'yas-no-prompt)

; Migemo
(when (require 'migemo nil t)
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

; smartparens
(when (require 'smartparens-config nil t)
  (smartparens-global-mode 1))

; Magit
(require 'magit)

; git-gutter
(global-git-gutter-mode +1)
(custom-set-variables '(git-gutter:update-interval 2))
(custom-set-variables '(git-gutter:lighter " GG"))

; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

; SmartCompile
(when (require 'smart-compile nil t)
  (setq smart-compile-alist (append '(("\\.rb\\'" . "ruby %f")) smart-compile-alist))
  (global-set-key (kbd "C-x c") 'smart-compile)
  (global-set-key (kbd "C-x C-m") (kbd "C-x c C-m")))

; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

; set the style "stroustrup" to C, C++, Java
(defun my-c-mode-hook ()
  (c-set-style "stroustrup")
  (setq indent-tabs-mode nil))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)
(add-hook 'java-mode-hook 'my-c-mode-hook)

; markdown-mode
(setq auto-mode-alist (cons '("\\.md\\'" . markdown-mode) auto-mode-alist))
(setq markdown-command "/usr/local/bin/markdown")

; prolog-mode
(setq auto-mode-alist (cons '("\\.pl\\'" . prolog-mode) auto-mode-alist))

; scala-mode
(setq scala-indent:step 4)

; haskell-mode
(setq auto-mode-alist (cons '("\\.hs\\'" . haskell-mode) auto-mode-alist))
(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook (lambda () (setq tab-width 4)))

; sh-mode
(defun my-sh-mode-hook()
  (setq indent-tabs-mode nil))
(add-hook 'sh-mode-hook 'my-sh-mode-hook)

; ruby-mode
(add-hook 'ruby-mode-hook (lambda () (setq flycheck-checker 'ruby-rubocop)))
(add-hook 'ruby-mode-hook 'robe-mode)
(add-hook 'robe-mode-hook 'ac-robe-setup)

; csharp-mode
(setq auto-mode-alist (cons '("\\.cs\\'" . csharp-mode) auto-mode-alist))
(add-hook 'csharp-mode-hook (lambda () (setq tab-width 4)))

;; yaml-mode
(setq auto-mode-alist (cons '("\\.yml\\'" . yaml-mode) auto-mode-alist))

;; haml-mode
(setq auto-mode-alist (cons '("\\.haml\\'" . haml-mode) auto-mode-alist))

;; coffee-mode
(setq auto-mode-alist (cons '("\\.coffee\\'" . coffee-mode) auto-mode-alist))
