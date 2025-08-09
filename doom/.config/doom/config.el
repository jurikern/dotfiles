;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Juri Kern"
      user-mail-address "juri@secbase.us")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
(setq doom-font (font-spec :family "CaskaydiaCove Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "CaskaydiaCove Nerd Font" :size 15))

(set-frame-parameter (selected-frame) 'alpha '(97 95))
(add-to-list 'default-frame-alist '(alpha 97 95))

(use-package corfu
  :init
  (global-corfu-mode)
  (setq corfu-auto t
        corfu-auto-delay 0.2
        corfu-auto-prefix 2)
)

(use-package cape
  :init
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-keyword))

(setq eglot-ignored-server-capabilities '(:documentHighlightProvider :hoverProvider :workspace/didChangeWorkspaceFolders))

(fset #'jsonrpc--log-event #'ignore)
(setq eglot-events-buffer-size 0)
(setq eglot-sync-connect nil)
(setq eldoc-idle-delay 1.0)
(setq eglot-send-changes-idle-time 0.5)
(setq doom-modeline-icon nil
      doom-modeline-hud nil
      doom-modeline-buffer-state-icon nil)
(setq org-persist nil)
;; (setq company-idle-delay 0.2)
;; (setq company-minimum-prefix-length 2)

(defun eldoc-on-demand-only ()
  (interactive)
  (setq-local eldoc-documentation-strategy #'eldoc-documentation-compose-eager)
  (setq-local eldoc-documentation-functions nil)
  (eldoc-mode -1))

(defun eglot-force-reconnect ()
  (interactive)
  (save-buffer)
  (when-let ((eglot-server (eglot-current-server)))
    (eglot-reconnect eglot-server)))

(add-hook 'eglot-managed-mode-hook #'eldoc-on-demand-only)

;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(use-package! exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(setq eglot-server-programs
      '((ruby-mode . ("ruby-lsp"))
        (java-mode . ("~/dev/tools/bin/jdtls"
                      "-data" "~/src/java"))))

(add-hook 'ruby-mode-hook #'eglot-ensure)
(add-hook 'java-mode-hook #'eglot-ensure)

(map! :map ruby-mode-map
      :localleader
      :desc "Reconnect LSP (force reindex)" "w" #'eglot-force-reconnect
      :desc "Format buffer" "f" #'eglot-format-buffer)

(defun eglot-safe-reconnect ()
  (interactive)
  (when (eglot-managed-p)
    (eglot-shutdown (eglot-current-server)))
  (eglot-ensure))

(map! :map java-mode-map
      :localleader
      :desc "Reconnect LSP (force reindex)" "w" #'eglot-safe-reconnect
      :desc "Format buffer" "f" #'eglot-format-buffer)

(defvar rsync-default-destination "arch:/var/src/"
  "Default destination path for rsync.")

(defun rsync-current-file (destination)
  (interactive
   (list (read-string "Rsync file to: " rsync-default-destination)))
  (let ((file (buffer-file-name)))
    (if file
        (async-shell-command
         (format "rsync -avz --delete '%s' '%s'" file destination))
      (message "This buffer is not visiting a file."))))

(defvar rsync-project-destination "arch:/var/src/"
  "Default rsync target directory for full project sync.")

(defun rsync-current-project (destination)
  (interactive
   (list (read-string "Rsync project to: " rsync-project-destination)))
  (let ((project-root (projectile-project-root)))
    (if project-root
        (async-shell-command
         (format "rsync -avz --delete --exclude \".git/\" --exclude \"tmp/\" '%s' '%s'" (file-name-as-directory project-root) destination))
      (message "Not in a project."))))

(map! :leader
      :desc "Rsync current file"
      "c y" #'rsync-current-file)

(map! :leader
      :desc "Rsync current project"
      "c p" #'rsync-current-project)

(add-hook 'ruby-mode-hook
          (lambda ()
            (setq ruby-indent-level 2
                  ruby-deep-indent-paren nil)))
(setq-default ruby-indent-level 2)
;; (add-hook 'ruby-mode-hook #'(lambda () (smartparens-mode -1)))
(defun disable-ruby-do-end-pair ()
  (sp-with-modes '(ruby-mode)
    (sp-local-pair "do" "end" :actions nil)
    (sp-local-pair "|" nil :actions nil)))

(add-hook 'ruby-mode-hook #'disable-ruby-do-end-pair)

(package! string-inflection
  :recipe (:host github :repo "akicho8/string-inflection" :branch "main"))
