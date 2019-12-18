(package-initialize)

(require 'package)

(add-to-list 'package-archives
         '("MELPA" . "http://melpa.milkbox.net/packages/") t)

(defun install-package (package)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

(install-package 'paredit)
(install-package 'expand-region)

(defun setup-lisp-mode ()
  (require 'paredit)
  (paredit-mode)
  (define-key paredit-mode-map (kbd "C-w") 'paredit-backward-kill-word))

(add-hook 'lisp-mode-hook
      'setup-lisp-mode)

(add-hook 'emacs-lisp-mode-hook
      'setup-lisp-mode)

;; используем C-w для удаления слова с опечаткой и последующего набора его заново
;; вместо kill-region
(global-set-key (kbd "C-w") 'backward-kill-word)
;; вместо кучи команд начинающихся с kmacro-
(global-set-key (kbd "C-x C-k") 'kill-region)
;; вместо indent-new-comment-line
(global-set-key (kbd "M-j")
                (lambda ()
                  (interactive)
                  (join-line -1)))

;; поиск и замена
(global-set-key (kbd "C-c r s") 'replace-string)
(global-set-key (kbd "C-c r r") 'replace-regexp)

;; по этому сочетанию emacs начинает выделять формы
;; и дальше можно просто нажимать =, чтобы расширить
;; выделение на родительскую форму.
(global-set-key (kbd "C-c =") 'er/expand-region)
;; это сочетание удобно использовать с предыдущим,
;; чтобы быстро выделить и закомментировать кусок кода
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)

(global-set-key (kbd "C-c C-\\") 'goto-last-change)

(setq custom-file "~/.emacs.d/customizations.el")
(when (file-exists-p custom-file)
  (load custom-file))
