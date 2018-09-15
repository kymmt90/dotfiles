; Cask

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
(cask-initialize)

(exec-path-from-shell-initialize)

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

; line truncation
(setq-default truncate-partial-width-windows t)
(setq-default truncate-lines t)

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

(global-set-key (kbd "C-j") 'newline-and-indent)


; set ascii font
(set-face-attribute 'default nil
                    :family "Source Han Code JP R"
                    :height 120)

; set Hiragino Kaku Gothic ProN as Japanese set.
(set-fontset-font
 nil 'japanese-jisx0208
 (font-spec :family "Source Han Code JP R"))

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
  (set-frame-parameter nil 'alpha 85))

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

;; ag
(when (require 'ag nil t)
  (setq ag-highlight-search t))

; Migemo
(when (require 'migemo nil t)
  (setq migemo-options '("-q" "--emacs"))
  (setq migemo-command "/usr/local/bin/cmigemo")
  (setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8)
  (load-library "migemo")
  (migemo-init)
)

; Helm
(when (require 'helm-config nil t)
  (helm-mode 1)
  (helm-migemo-mode 1)
  (global-set-key (kbd "C-x b") 'helm-buffers-list)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-c f") 'helm-for-files)
  (global-set-key (kbd "C-c y") 'helm-show-kill-ring)
  (global-set-key (kbd "M-x") 'helm-M-x))
(when (require 'helm-ag nil t)
  (global-set-key (kbd "C-c s") 'helm-ag))

; auto-complete
(when (require 'auto-complete-config nil t)
  (ac-config-default)
  (setq ac-use-menu-map t))

; smartparens
(when (require 'smartparens-config nil t)
  (smartparens-global-mode 1))

; Magit
(when (require 'magit nil t))

; git-gutter
(global-git-gutter-mode +1)
(custom-set-variables '(git-gutter:update-interval 2))
(custom-set-variables '(git-gutter:lighter " GG"))

; SmartCompile
(when (require 'smart-compile nil t)
  (setq smart-compile-alist (append '(("\\.rb\\'" . "ruby %f")) smart-compile-alist))
  (global-set-key (kbd "C-x c") 'smart-compile)
  (global-set-key (kbd "C-x C-m") (kbd "C-x c C-m")))

;; inf-ruby
(setq inf-ruby-default-implementation "pry")

;; rbenv
(setq rbenv-installation-dir "/usr/local/rbenv")
(when (require 'rbenv nil t)
  (global-rbenv-mode)
  (rbenv-use "2.3.1"))

;; Flycheck
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)

; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (when (require 'eldoc nil t)
               (setq eldoc-idle-delay 0.2)
               (setq eldoc-echo-area-use-multiline-p t)
               (turn-on-eldoc-mode))))

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

; csharp-mode
(setq auto-mode-alist (cons '("\\.cs\\'" . csharp-mode) auto-mode-alist))
(add-hook 'csharp-mode-hook (lambda () (setq tab-width 4)))

;; yaml-mode
(setq auto-mode-alist (cons '("\\.yml\\'" . yaml-mode) auto-mode-alist))

;; haml-mode
(setq auto-mode-alist (cons '("\\.haml\\'" . haml-mode) auto-mode-alist))

;; coffee-mode
(setq auto-mode-alist (cons '("\\.coffee\\'" . coffee-mode) auto-mode-alist))

;; js2-mode
(setq auto-mode-alist (cons '("\\.js\\'" . js2-mode) auto-mode-alist))
(defun my-js2-mode-hook()
  (setq-default indent-tabs-mode nil)
  (setq js2-basic-offset 2)
  (setq js2-include-browser-externs nil)
  (setq js2-mode-show-parse-errors nil)
  (setq js2-mode-show-strict-warnings nil)
  (setq js2-highlight-external-variables nil)
  (setq js2-include-jslint-globals nil))
(add-hook 'js2-mode-hook 'my-js2-mode-hook)
(setq-default flycheck-disabled-checkers '(javascript-jshint javascript-jscs))

;; web-mode
(when (require 'web-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.scss\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.xml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode)))

(defun my-web-mode-hook()
  (setq-default indent-tabs-mode nil)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook 'my-web-mode-hook)

;; ruby-mode
(setq ruby-insert-encoding-magic-comment nil)
(setq-default flycheck-disabled-checkers '(ruby ruby-rubylint ruby-rubocop))
(add-hook 'ruby-mode-hook 'robe-mode)
(autoload 'robe-mode "robe" "Code navigation, documentation lookup and completion for Ruby" t nil)
(autoload 'ac-robe-setup "ac-robe" "auto-complete robe" nil nil)
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; php-mode
(when (require 'php-mode nil t)
  (defun php-indent-hook ()
    (c-set-offset 'case-label '+)
    (c-set-offset 'arglist-intro '+)
    (c-set-offset 'arglist-close 0))
  (add-hook 'php-mode-hook 'php-indent-hook))

;; go-mode
(exec-path-from-shell-copy-env "GOROOT")
(exec-path-from-shell-copy-env "GOPATH")
(setq gofmt-command "goimports")
(when (require 'go-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
  (add-hook 'before-save-hook 'gofmt-before-save))

;; slim-mode
(when (require 'slim-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.slim?\\'" . web-mode)))

;; typescript-mode
(when (require 'typescript-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ts?\\'" . typescript-mode)))
