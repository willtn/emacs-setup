(defconst my-home-directory (concat (getenv "HOME") "/"))

;; global variables
(setq
 inhibit-startup-screen t
 create-lockfiles nil
 make-backup-files nil
 column-number-mode t
 scroll-error-top-bottom t
 show-paren-delay 0.5
 use-package-always-ensure t
 sentence-end-double-space nil)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; buffer local variables
(setq-default
 indent-tabs-mode nil
 tab-width 2
 c-basic-offset 2)

;; modes
(electric-indent-mode 0)
(fset `yes-or-no-p `y-or-n-p)

;; the package manager
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
(setq package-archive-priorities '(("melpa-stable" . 1)))
(package-initialize)

;; bootstrap 'use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(eval-when-compile
  (require 'use-package))

;; bootstrap 'use-package-chords
(use-package use-package-chords
  :config (key-chord-mode 1))
  
;;(add-to-list 'load-path (concat my-home-directory ".emacs.d/lisp/"))
(add-to-list 'exec-path "/usr/bin")

;; Load dakrone theme
(use-package dakrone-theme
  :init (load-theme 'dakrone t))

;; Load custom keymaps
(use-package my-keymaps
  :ensure nil
  :load-path "lisp/")

;; bootstrap 'ensime
(use-package ensime
  :pin melpa-stable)

;; bootstrap 'helm
(use-package helm
  :chords (("bl" . helm-M-x))
  :bind (("C-x C-m" . helm-M-x)
          ("C-c C-m" . helm-M-x)
          ("C-x b" . helm-mini)
          ("C-x C-f" . helm-find-files)))

;; bootstrap zoom-frm
(use-package zoom-frm
  :bind (("C-=" . zoom-frm-in)
         ("C--" . zoom-frm-out)))

;; bootstrap projectile
(use-package projectile)

;; bootstrap helm-projectile
(use-package helm-projectile
  :chords (("pl" . helm-projectile-switch-project))
  :init (helm-projectile-on))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (helm-projectile projectile ensime zoom-frm helm key-chord dakrone-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

