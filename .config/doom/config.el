;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

;; Put predefined text in empty files by extension
(auto-insert-mode t)

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Roger Pibernat"
      user-mail-address "alo@rogerpibernat.com")

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
;; default font
;; (setq doom-font (font-spec
;;                  :family "Iosevka Medium Extended"
;;                  ;; :weight 'semi-light
;;                  :size 12))
(setq doom-font (font-spec
                 :family "mononoki"
                 ;; :weight 'semi-light
                 :size 18))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-henna)
;; (setq doom-theme 'doom-one)
;; (setq doom-theme 'doom-snazzy)
;; (setq doom-theme 'doom-oceanic-next)
;; (setq doom-theme 'doom-ayu-mirage)

;; custom background color from KDE's breeze-dark theme
;; (add-to-list 'default-frame-alist '(foreground-color . "#fcfcfc"))
;; (add-to-list 'default-frame-alist '(background-color . "#222528"))

;; custom theme
(add-to-list 'custom-theme-load-path "~/.config/doom/themes")
(setq doom-theme 'doom-breeze-dark)
;; (load-theme 'doom-breeze-dark)

;; dired
(use-package dired
  :ensure nil
  :commands (dired dired-jump)
  :bind (("C-x C-j" . dired-jump))
  :custom ((dired-listing-switches "-aghoX --group-directories-first"))
  :config
  (evil-collection-define-key 'normal 'dired-mode-map
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(use-package dired-single)

;; (use-package all-the-icons-dired
;;   :hook (dired-mode . all-the-icons-dired-mode))

(map! (:map dired-mode-map :localleader :n "P" 'peep-dired))
(map! (:map peep-dired-mode-map :n "j" 'peep-dired-next-file))
(map! (:map peep-dired-mode-map :n "k" 'peep-dired-prev-file))
(add-hook 'peep-dired-hook 'evil-normalize-keymaps)

(map! (:map sclang-mode-map :localleader :n "s s" 'sclang-start))

(map! (:map org-mode-map :n "<return>" 'org-toggle-checkbox))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))
(setq org-directory "~/Dropbox/org/")
(setq org-default-notes-file (concat org-directory "/main.org"))
(setq org-capture-templates
      '("w" "work" plain (file "~/Drobpox/org/work.org")
        "* TODO %?\n "))
;; (use-package org-bullets
;;   :config
;;   (add-hook 'org-mode-hook (lambda() (org-bullets-mode))))
;; (setq org-superstar-headline-bullets-list '("⬢" "◆" "▲" "■"))
(custom-set-faces)

;; show linked images as inline images
(require 'org-attach)
(setq org-link-abbrev-alist '(("att" . org-attach-expand-link)))
(setq org-startup-with-inline-images t)
(setq org-image-actual-width (/ (window-pixel-width) 2))
;; (defun org-roam--extract-titles-custom (headline title alias))
;; (setq org-roam-title-sources org-roam--extract-titels-custom)
(custom-set-faces
 '(org-level-1 ((t (:family "Noto Sans" :foreground "#fcfcfc" :height 100 :weight bold))))
 '(org-tag ((t (:height 80)))))

(setq org-todo-keyword-faces
      '(("TODO" . org-warning)
        ("ON" . (:foreground "#55CC66" :weight bold))
        ("STBY" . (:foreground "#999999"))))
;; (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "OPEN(o)" "INTR(i)" "DONE(d)")))
;; (setq org-agenda-span 'day)
;; (setq org-agenda-todo-ignore-scheduled 'future)
;; (setq ort-agenda-skip-deadline-prewarning-if-scheduled 'pre-scheduled)
;; (setq org-agenda-custom-commands
  ;; '(("n" "Agenda / INTR / OPEN / NEXT"
  ;;    ((agenda "" nil)
  ;;     (todo "INTR" nil)
  ;;     (todo "OPEN" nil)
  ;;     (todo "NEXT" nil))
  ;;    nil)))


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(setq doom-localleader-key ",")
(setq org-toggle-inline-images t)

;; org bullets
(setq org-superstar-special-todo-items t)
(add-hook 'org-mode-hook (lambda ()
                        (org-superstar-mode 1)))

;; ;; Here are some additional functions/macros that could help you configure Doom:
;; ;;
;; ;; - `load!' for loading external *.el files relative to this one
;; ;; - `use-package!' for configuring packages
;; ;; - `after!' for running code after a package has loaded
;; ;; - `add-load-path!' for adding directories to the `load-path', relative to
;; ;;   this file. Emacs searches the `load-path' when you load packages with
;; ;;   `require' or `use-package'.
;; ;; - `map!' for binding new keys
;; ;;
;; ;; To get information about any of these functions/macros, move the cursor over
;; ;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; ;; This will open documentation for it, including demos of how they are used.
;; ;;
;; ;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; ;; they are implemented.

;; (add-hook 'after-init-hook 'org-roam-mode)

;; line wrapping
(add-hook 'text-mode-hook 'visual-line-mode)

;; TODO it works everything but the 'if' statement, and needs tweaking
(defun olivetti-poet ()
  "Face remapping for buffers in olivetty mode."
  (face-remap-add-relative 'default :family "CMU Serif" :height 130)
  ;; (face-remap-add-relative 'default :family "DejaVu Sans Mono" :height 130)
  (face-remap-add-relative 'fixed-pitch :family "DejaVu Sans Mono")
  (face-remap-add-relative 'variable-pitch :family "IBM Plex Serif")
  (face-remap-add-relative 'org-level-1 :height (lambda (_x) (poet-theme--height 1)) :weight 'bold)
  ;; (if (custom-theme-enabled-p 'poet)
  ;;     (load-theme 'doom-one)
  ;;   (load-theme 'poet)
  ;;   )
  )

;; (add-hook 'olivetti-mode-hook (lambda () (variable-pitch-mode 1)))
;; (add-hook 'olivetti-mode-hook #'olivetti-poet)

;; visual line navigation
;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)

(defun increment-number-at-point ()
  "Increment number under cursor"
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1+ (string-to-number (match-string 0)))))
  (evil-move-cursor-back))
(defun decrement-number-at-point ()
  "Decrement number under cursor"
  (interactive)
  (skip-chars-backward "0-9")
  (or (looking-at "[0-9]+")
      (error "No number at point"))
  (replace-match (number-to-string (1- (string-to-number (match-string 0)))))
  (evil-move-cursor-back))

(map! :leader "a" 'increment-number-at-point)
(map! :leader "x" 'decrement-number-at-point)

;; impatient-mode (markdown preview)
(defun markdown-html (buffer)
  (princ (with-current-buffer buffer
    (format "<!DOCTYPE html><html><title>Impatient Markdown</title><xmp theme=\"united\" style=\"display:none;\"> %s  </xmp><script src=\"http://strapdownjs.com/v/0.2/strapdown.js\"></script></html>" (buffer-substring-no-properties (point-min) (point-max))))
  (current-buffer)))

;; python
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
(defun my-restart-python-console ()
  "Restart python console before evaluate buffer or region to avoid various uncanny conflicts, like not reloding modules even when they are changed"
  (interactive)
  (kill-process "Python")
  (sleep-for 0.05)
  (kill-buffer "*Python*"))
  ;; (elpy-shell-send-region-or-buffer))

(map! (:map python-mode-map
       :localleader
       :n "." 'my-restart-python-console
       :desc "Restart python console"))
(map! (:map python-mode-map
       :localleader
       :n "m" 'elpy-shell-send-region-or-buffer
       :desc "Run python code"))

;; ;; blender
;; (defun loopier-save-blender-addon ()
;;   (interactive)
;;   ;; get filename
;;   (setq split-path (split-string (file-name-directory (buffer-file-name)) "/"))
;;   (setq dir-name (nth (- (length split-path) 2) split-path))
;;   (setq zip-file-name (concat dir-name ".zip"))

;;   ;; compress zip
;;   (shell-command (concat "zip -r ../" zip-file-name " ../" dir-name "/"))
;;   ;; (message (concat "zip -r " zip-file-name " " dir-name "/"))
;;   )

;; (map! (:map python-mode-map
;;        :localleader
;;        :n "b" 'loopier-save-blender-addon
;;        :desc "Create a Blender add-on bundle from this package"))

;; supercollider
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/SuperCollider")
(require 'sclang)
(require 'w3m)

;; livecode
;; experimental livecoding helper
(load "/home/r/loopier/code/emacs-extended/livecode.el")

(add-to-list 'load-path "/home/r/loopier/code/ob-sclang/")
(org-babel-do-load-languages
 'org-babel-load-languages
 '((sclang . t)))

(map! (:map org-mode-map :localleader :n "m" 'org-ctrl-c-ctrl-c))

(defun livecode ()
  ;; (split-window-right)
  (interactive)
  (sclang-start)
  ;; (windmove-right)
  ;; (toggle-truncate-lines)
  ;; (buf-move-left)
  ;; (windmove-right)
  (switch-to-buffer "*SCLang:PostBuffer*")
  (window-resize nil -50 t)
  (windmove-right)
  (switch-to-buffer "*SCLang:Workspace*")
  (sclang-mode))

;; run when entering sclang-mode
;; (advice-add 'sclang-show-post-buffer :after #'sclang-move-post-left)

;; (add-to-list 'sclang-mode-alist '("\\.scd\\.sc\\" . sclang-mode))
(map! :leader :n "o s" 'sclang-start :desc "Open Supercollider") ;; global under 'SPC-o' menu
(map! (:map sclang-mode-map :localleader :n "s s" 'sclang-start))
(map! (:map sclang-mode-map :localleader :n "s q" 'sclang-stop))
(map! (:map sclang-mode-map :localleader :n "s r" 'sclang-recompile))
(map! (:map sclang-mode-map :localleader :n "." 'sclang-main-stop))
(map! (:map sclang-mode-map :localleader :n "m" 'sclang-eval-defun))
(map! (:map sclang-mode-map :localleader :n "," 'sclang-eval-line))
(map! (:map sclang-mode-map :localleader :n "r" 'sclang-eval-region))
(map! (:map sclang-mode-map :localleader :n "e" 'sclang-eval-expression))
(map! (:map sclang-mode-map :localleader :n "f" 'sclang-eval-document))
(map! (:map sclang-mode-map :localleader :n "w" 'sclang-switch-to-workspace))
(map! (:map sclang-mode-map :localleader :n "p" 'sclang-switch-to-post))
(map! (:map sclang-mode-map :localleader :n "<" 'sclang-clear-post-buffer))
(map! (:map sclang-mode-map :localleader :n ">" 'sclang-show-post-buffer))
;; (map! (:map sclang-mode-map :localleader :n "l" 'sclang-move-post-left))
(map! (:map sclang-mode-map :localleader :n "h" 'sclang-goto-help-browser))
(map! (:map sclang-mode-map :localleader :n "H" 'sclang-open-help-gui))
(map! (:map sclang-mode-map :localleader :n "D" 'sclang-find-help-in-gui))
(map! (:map sclang-mode-map :localleader :n "d" 'sclang-find-help))
(map! (:map sclang-mode-map :localleader :n "i" 'sclang-find-definitions))
;; (map! (:map sclang-mode-map :localleader :n "d" 'sclang-))
(setq sclang-eval-line-forward nil)
;; (setq sclang-show-workspace-on-startup nil)

;; processing
(setq processing-location "/home/r/.local/bin/processing-java")
;; (setq processing-location "/home/r/.local/bin/processing")
(map! (:map processing-mode-map :localleader :n "," 'processing-sketch-run))

;; email
;; (use-package mu4e
;;   :ensure nil
;;   ;; :load-path "/usr/share/emacs/site-lisp/mu4e"
;;   :defer 20
;;   :config

;;   ;; This is set to 't' to avoi dmail syncing issues when using mbsync
;;   (setq mu4e-change-filenames-when-moving t)

;;   ;; Refresh mail using isync every 10 minutes
;;   (setq mu4e-update-interval (* 10 60))
;;   (setq mu4e-get-mail-command "mbsync -a -c ~/.config/mbsyncrc")
;;   (setq mu4e-maildir "~/Dropbox/mailmacs")
;;   (setq mu4e-split-view 'horizontal)

;;   (setq mu4e-drafts-folder      "/Drafts")
;;   (setq mu4e-sent-folder        "/[Gmail]/Sent Mail")
;;   (setq mu4e-refile-folder      "/[Gmail]/All Mail")
;;   (setq mu4e-trash-folder       "/Deleted Messages")

;;   (setq mu4e-maildir-shortcuts
;;         '(("/[Gmail]/Inbox" :key ?i)
;;           ("/[Gmail]/sent"  :key ?s)
;;           ("/Deleted Messages" :key ?t)
;;           ("/Drafts":key ?d)
;;           ("/[Gmail]/All Mail"   :key ?a)))
;;   (setq mu4e-bookmarks
;;         '((:name "Unread messages" :query "flag:unread AND NOT flag:trashed" :key 117)
;;           (:name "Today's messages" :query "date:today..now" :key 116)
;;           (:name "Last 7 days" :query "date:7d..now" :hide-unread t :key 119)
;;           (:name "Messages with images" :query "mime:image/*" :key 112)))

;;   )

;; ;; license
;; (defun gpl-notice (projectname filename description)
;;   "GPL notice text"
;;   ;; (interactive "sProject: ")
;;   (concat
;;    "//\n"
;;    "// " filename "\n"
;;    "//\n"
;;    "// " description "\n"
;;    "//\n"
;;    "// (C) " (format-time-string "%Y") " Roger Pibernat\n"
;;    "//\n"
;;    "// -- \n"
;;    "//\n"
;;    "// This file is part of " projectname ".\n"
;;    "//\n"
;;    "// " projectname " is free software: you can redistribute it and/or modify\n"
;;    "// it under the terms of the GNU General Public License as published by\n"
;;    "// the Free Software Foundation, either version 3 of the License, or\n"
;;    "// (at your option) any later version.\n"
;;    "//\n"
;;    "// " projectname " is distributed in the hope that it will be useful,\n"
;;    "// but WITHOUT ANY WARRANTY; without even the implied warranty of\n"
;;    "// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the\n"
;;    "// GNU General Public License for more details.\n"
;;    "//\n"
;;    "// You should have received a copy of the GNU General Public License\n"
;;    "// along with " projectname ".  If not, see <https://www.gnu.org/licenses/>.\n"
;;    "//\n"
;;    (make-string 70 ?/) "\n\n"
;;    ))

;; (defun insert-gpl-notice (project description)
;;     "Insert GPL notice"
;;   (interactive "sProject name:\s
;; sDescription: ")
;;   (evil-goto-line 1)
;;   (insert (gpl-notice project (buffer-name) description))
;;     )

;; aduino
(add-to-list 'auto-mode-alist '("\\.ino\\'" . cpp-mode))

(defvar arduino-project-file nil)

(defun arduino-set-project-file (filepath)
  "Set the FILEPATH to the file that Arduino should upload."
  (interactive "fChoose an Arduino project file: ")
  (setq arduino-project-file filepath)
  arduino-project-file)

(defun arduino-unset-project-file ()
  "Set arduino-project-file to nil."
  (arduino-set-project-file nil))

(defun arduino-upload ()
  "Upload arduino-project-file to Arduino."
  (interactive)
  (if (not arduino-project-file)
      (call-interactively 'arduino-set-project-file))
  (message "Uploading %s to Arduino" arduino-project-file)
  (shell-command (concat "arduino --upload " (or arduino-project-file (arduino-set-project-file)))))

(defun arduino-verify ()
  "Verify Arduino code in arduino-project-file."
  (interactive)
  (if (not arduino-project-file)
      (call-interactively 'arduino-set-project-file))
  (message "Arduino verifying code in %s" arduino-project-file)
  (shell-command (concat "arduino --verify " arduino-project-file)))

;; keybindings
(map! (:map cpp-mode-map :localleader :n "u" 'arduino-upload))
(map! (:map cpp-mode-map :localleader :n "v" 'arduino-verify))

;; (defun new-cpp-files (project name description)
;;   "Create C/C++ header and source files with licence notice"
;;   (interactive "sProject name:\s
;; sFile name:\s
;; sShort sescription: ")
;;   (with-temp-file (concat name ".h")
;;     (insert (concat
;;              (gpl-notice project (concat name ".h") description)
;;              ;; (make-string 70 ?/) "\n\n"
;;              (let* ((ident (concat (upcase name) "_H")))
;;                (concat "#ifndef " ident "\n"
;;                        "#define " ident  " 1\n"
;;                        "\n"
;;                        "//\n"
;;                        "\n"
;;                        "#endif // " ident "\n"))
;;              )))
;;   (with-temp-file (concat name ".cpp")
;;     (insert (concat
;;              "//\n"
;;              "// " name ".cpp\n"
;;              "//\n"
;;              "// (C) " (format-time-string "%Y") " Roger Pibernat\n"
;;              "//\n"
;;              (gpl-notice project)
;;              (make-string 70 ?/) "\n\n"
;;              "#include \"" name ".h\""
;;              )))
;;   (find-file (concat name ".cpp"))
;;   (find-file (concat name ".h"))
;;   )

;; ;; faust
;; (defun faust-compile-jack ()
;;   "Compile FAUST patch."
;;   (interactive)
;;   (shell-command (concat "faust2jack " (buffer-name))))

;; (defun faust-compile-owl ()
;;   "Convert FAUST patch to C++ code."
;;   (interactive)
;;   (shell-command (concat "faust2owl " (buffer-name))))

;; (defun faust-run ()
;;   "Run FAUST patch and connect it to VCV Rack."
;;   (interactive)
;;   (shell-command (concat "./" (file-name-base) " &"
;;                          "sleep 0.1; "
;;                          ;; "jack_connect " (file-name-base) ":out_0 'VCV Rack:inport 0' & "
;;                          ;; "jack_connect " (file-name-base) ":out_1 'VCV Rack:inport 1'"
;;                          ;; "jack_disconnect " (file-name-base) ":out_0 'system:playback_1'"
;;                          ;; "jack_disconnect " (file-name-base) ":out_1 'system:playback_2'"
;;                          ;; "jack_connect " (file-name-base) ":out_0 'LSP Oscilloscope x1:Input y 1'"

;;                          "jack_connect " (file-name-base) ":out_0 'Simple Scope (3 channel):In1' & "
;;                          "jack_connect " (file-name-base) ":out_1 'Simple Scope (3 channel):In2'"
;;                          )))

;; (defun faust-compile-run-jack ()
;;   "Compile and run FAUST patch."
;;   (interactive)
;;   (faust-compile-jack)
;;   (faust-run))
;;   ;; (shell-command (concat "faust2jack " (buffer-name) "; ./" (file-name-base) " &"
;;   ;;                        "sleep 0.1; "
;;   ;;                        "jack_connect " (file-name-base) ":out_0 'VCV Rack:inport 0' & "
;;   ;;                        "jack_connect " (file-name-base) ":out_1 'VCV Rack:inport 1'" )))


;; (add-to-list 'auto-mode-alist '("\\.dsp\\'" . faust-mode))
;; (map! (:map faust-mode-map :localleader :n "," 'faust-compile-run-jack))
;; (map! (:map faust-mode-map :localleader :n "b" 'faust-compile-jack))
;; (map! (:map faust-mode-map :localleader :n "o" 'faust-compile-owl))
;; (map! (:map faust-mode-map :localleader :n "r" 'faust-run))
;; (map! (:map faust-mode-map :localleader :n "c" 'faust-cpp))
;; (map! (:map fauct-mode-map :localleader :n "w" 'faust-compile-owl))

;; ;; owl-mode
;; ;; (add-to-list 'auto-mode-alist '("\\.dsp\\'" . owl-mode))
;; ;; (setq owl-path "~/OwlProgram")
;; ;; (defun owl-load-faust ()
;; ;;   "Compile and load FAUST code to OWL platform."
;; ;;   (interactive)
;; ;;   (shell-command (concat "make -C " owl-path " clean " "FAUST=" (file-name-base) " load")))
;; ;; (defun owl-load-cpp ()
;; ;;   "Compile and load FAUST code to OWL platform."
;; ;;   (interactive)
;; ;;   (shell-command (concat "make -C " owl-path " clean " "PATCHNAME=" (file-name-base) " load")))
;; ;; (defun owl-compile-faust ()
;; ;;   "Compile FAUST code to OWL platform."
;; ;;   (interactive)
;; ;;   (shell-command (concat "make -C " owl-path " clean " "FAUST=" (file-name-base))))

;; ;; (define-minor-mode owl-mode
;; ;;   "A mode for developing OpenWareLab patches."
;; ;;   :lighter " owl"
;; ;;   :keymap (let ((map (make-sparse-keymap)))))

;; ;; (add-hook 'faust-mode-hook 'owl-mode)

;; ;; (map! (:map owl-mode-map :localleader :n "o f" 'owl-load-faust))
;; ;; (map! (:map owl-mode-map :localleader :n "o f" 'owl-compile-faust))
;; ;; ;; (map! (:map owl-mode-map :localleader (:prefix ("l" . "owl-load")
;; ;; ;;                                        :n "f" #'owl-load-faust
;; ;; ;;                                        :n "c" #'owl-load-cpp)))

;; ;; godot - https://github.com/godotengine/emacs-gdscript-mode
;; ;; (map! (:map gdscript-mode-map :localleader :n "r" 'gdscript-godot-run-project))
;; ;; (add-to-list 'auto-mode-alist '("\\.gd\\'" . gdscript-mode))

;; (projectile-add-known-project "~/projects/animatron")
;; (projectile-add-known-project "~/projects/accounting")
