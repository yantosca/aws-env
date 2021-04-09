;------------------------------------------------------------------------------
;          Harvard University Atmospheric Chemistry Modeling Group            !
;------------------------------------------------------------------------------
;BOP
;
; !MODULE: .emacs.d/init.el
;
; !DESCRIPTION: The .emacs file specifes user-customization settings for
;  the Emacs editor.
;\\
;\\
; !REMARKS:
;  Please peruse this file carefully!  For many settings there are several
;  options that you can pick from.  You can uncomment the settings that you
;  would like to use and comment out the ones that you don't.
;                                                                             .
;  The comment character for this file is ";".
;  Logical switches are turned on with "t" and turned off with "nil".
;                                                                             .
;  Also be sure to set your default email address under "MISCELLANEOUS STUFF".
;                                                                             .
;  Changes made to this file will not take effect until the next time 
;  you start Emacs.  Therefore, we recommend keeping one Emacs window
;  open and then open additional Emacs windows to determine if you like the
;  new settings (or if you wish to revert to the previous settings).
;                                                                             .
;  NOTE: The "FRAME SIZE AND POSITION" section works better at the bottom
;  of the file, so we will leave it there.  You can uncomment the various
;  lines of code to control the height and width of the Emacs window.
;  You can also decide if you want to stack windows horizontally or
;  vertically.
;
; !REVISION HISTORY:
;  Use the gitk browser to view the version history!
;EOP
;------------------------------------------------------------------------------
;BOC

;;=============================================================================
;; FONTS - customize to look best on your system!
;;=============================================================================

;; DejaVuSansMono 12pt bold
(set-face-font
 'default "-*-DejaVuSansMono-Bold-R-*-*-*-120-*-*-*-*-iso8859-1" )

;; Lucida Typewriter 14pt bold
;(set-face-font
; 'default "-*-Lucidatypewriter-Bold-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Example of normal instead of bold
;; Lucida Typewriter 14pt normal
;(set-face-font
; 'default "-*-Lucidatypewriter-*-R-*-*-*-140-*-*-*-*-iso8859-1" )

;; Example of different font size
;;Lucida Typewriter 13pt bold
;(set-face-font
; 'default "-*-Lucidatypewriter-Bold-R-*-*-*-130-*-*-*-*-iso8859-1" )

;; Example of different font type
;; Courier 13 pt bold
;(set-face-font
; 'default "-*-Courier-Bold-R-*-*-*-130-*-*-*-*-iso8859-1" )

;;=============================================================================
;; COLOR SETTINGS - customize
;;=============================================================================

;; BACKGROUND COLOR OPTIONS (ignored if using -nw)
(unless (featurep 'no-window-system) (set-face-background 'default "gray75"))
;(unless (featurep 'no-window-system) (set-face-background 'default "FloralWhite")
;(unless (featurep 'no-window-system) (set-face-background 'default "dark slate gray")
;(unless (featurep 'no-window-system) (set-face-foreground 'default "blanched almond")
;(unless (featurep 'no-window-system) (set-face-foreground 'default "black")

;; "COLORIZATION" COLORS FOR CODE
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(dired-face-symlink ((t (:foreground "white" :background "darkOrchid"))))
 '(font-lock-builtin-face ((t (:foreground "red2"))))
 '(font-lock-comment-face ((t (:foreground "#6920ac"))))
 '(font-lock-doc-face ((t (:foreground "green4"))))
 '(font-lock-doc-string-face ((t (:foreground "green4"))))
 '(font-lock-function-name-face ((t (:foreground "red2"))))
 '(font-lock-keyword-face ((t (:foreground "orange3"))))
 '(font-lock-other-type-face ((t (:foreground "blue"))))
 '(font-lock-preprocessor-face ((t (:foreground "red2"))))
 '(font-lock-reference-face ((t (:foreground "red2"))))
 '(font-lock-string-face ((t (:foreground "green4"))))
 '(font-lock-type-face ((t (:foreground "brown"))))
 '(font-lock-variable-name-face ((t (:foreground "blue"))))
 '(sh-heredoc ((((class color) (background light)) (:foreground "green4")))))

;; Enable syntax highlighting for .bashrc_OD and .bashrc_AS templates
;; and other startup files

;; Set syntax highlighting for diff mode (*.diff files)
(defun update-diff-colors ()
  "update the colors for diff faces"
  (set-face-attribute 'diff-added nil
                      :foreground "black" :background "DarkSeaGreen1")
  (set-face-attribute 'diff-removed nil
                      :foreground "black" :background "RosyBrown1")
  (set-face-attribute 'diff-changed nil
                      :foreground "black" :background "wheat1"))
(eval-after-load "diff-mode"
  '(update-diff-colors))

;;=============================================================================
;; FUNCTIONS and GLOBAL SETTINGS
;;=============================================================================

;; Whatever your configuration is, you get TWO WINDOWS SPLIT VERTICAL. If
;; it is already the case, the left and right buffers are switched.
(defalias 'two-windows-vertical
  (read-kbd-macro "C-x 1 C-x 3 C-x b RET"))

;; kill process (like a tail -f) and purge output. In shell mode.
(defalias 'quitnclean
  (read-kbd-macro "C-c C-\\ C-c C-o"))

;; for quick swap b/w 2 buffers
(defalias 'swapbuffer
  (read-kbd-macro "C-x b RET"))

;; EDIFF : to restore my 2 windows setting w/ each compared file in one window
(defalias 'clean-after-ediff
  (read-kbd-macro "C-x 1 C-x 3 C-x b RET"))

;;; EDIFF : like clean-after-ediff but close the two compared windows
;;; This one depends on the bindings below
;(defalias 'fullcleanediff
;  (read-kbd-macro "<f3> <C-f2> <f3>"))

;; EDIFF : close the two compared windows
;; This one depends on the bindings below
(defalias 'fullcleanediff
  (read-kbd-macro "<f3> <f2> <f3>"))

;; OMIT :
;; This C-o business was working in Xemacs, but it is not in Emacs...:
;; to add ".mod" to the list of file type to omit when you do C-o in Directory
(defalias 'omitmod
  (read-kbd-macro "C-u %o.mod RET"))

;; So redefined the "omit" functions for Emacs in dired mode:
(fset 'omitdotfiles
      [?% ?m ?^ ?\\ ?. ?. ?* return ?k])

;; and this one will omit .o, .mod, ~, and . files from directory listing
(fset 'omit-fortran
      [?% ?m ?^ ?\\ ?. ?\\ ?| ?\\ ?. ?o ?$ ?\\ ?| ?\\ ?. ?m ?o ?d ?$ ?\\ ?| ?~ ?$ return ?k])


;; customized insertion of timestamp (function is defined below in miscella.)
(fset 'macrotimestamp
      [?\M-x ?i ?n ?s ?e ?r ?t ?- ?t ?i ?m ?e ?s ?t tab return return left ? ])

;;=============================================================================
;; MOTION SETTINGS
;; M-n / M-p (and M-up / M-down) scroll buffer ahead / behind
;;=============================================================================
(defalias 'scroll-ahead 'scroll-up)
(defalias 'scroll-behind 'scroll-down)

(defun scroll-n-lines-ahead (&optional n)
  "Scroll ahead N lines (1 by default)."
  (interactive "P")
  (scroll-ahead (prefix-numeric-value n)))

(defun scroll-n-lines-behind (&optional n)
  "Scroll behind N lines (1 by default)."
  (interactive "P")
  (scroll-behind (prefix-numeric-value n)))

;; To scroll only one line when cursor is at the bottom of the screen
;; (instead of finding the lastline suddenly in the middle)
;; (I use it in conjonction with C-l to get the cursor at the middle of
;;  the screen if this is what I really want)
(setq scroll-step 1)

;;=============================================================================
;; DISPLAY CUSTOMIZATIONS
;;=============================================================================

;; To scroll only one line when cursor is at the bottom of the screen
;; (instead of finding the lastline suddenly in the middle)
;; (I use it in conjonction with C-l to get the cursor at the middle of
;;  the screen if this is what I really want)
(setq scroll-step 1)

;; Display path name in window title
(setq frame-title-format "%S: %f")

;; Turn on line and column number mode
(setq-default line-number-mode   t)
(setq-default column-number-mode t)

;; get date and time in the info bar ("mode line")
(setq display-time-day-and-date t)
(setq display-time-string-forms
      (quote
       ((if (and (not display-time-format)
		 display-time-day-and-date)
	    (format-time-string "%a %b %e   " now) "  ")
	(format-time-string
	 (or display-time-format
	     (if display-time-24hr-format "%H:%M" "%-I:%M%p")) now)
	))
      )
(display-time)

;; To insert a basic time stamp in a buffer
(defun insert-timestamp ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "!  %e %b %Y - R. Yantosca - ")))

;; no splash screen at start
(setq inhibit-splash-screen t)   ;; not working w/ 21.4
(setq inhibit-startup-message t) ;; working w/ 21.4

;; C-k kills line and end of line
(setq kill-whole-line t)

;; Enable multiple minibuffers.  If you don't do this, then you
;; can't do things like search the minibuffer history with M-s.
(setq minibuffer-max-depth nil)

;; to answer Y/ N instead of YES/NO RET when asked for confirmation
;; NOTE: not for newbies!
(defalias 'yes-or-no-p 'y-or-n-p)

;; Put vertical scroll bar on the left (bmy, 5/30/17)
(set-scroll-bar-mode 'left)

;; Set Ediff window splitting
;;(setq ediff-split-window-function 'split-window-horizontally) ;; horizontal
(setq ediff-split-window-function 'split-window-vertically)     ;; vertical

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(column-number-mode t)
 '(current-language-environment "ASCII")
 '(display-time-mode t)
 '(global-font-lock-mode t nil (font-lock))
 '(query-user-mail-address nil)
 '(user-mail-address "yantosca@seas.harvard.edu"))

;;=============================================================================
;; BACKUP & AUTOSAVE
;;=============================================================================
(setq backup-by-copying t)     ;; for symlinks to refer to the last version
(setq delete-old-versions t)   ;; delete excess backups silently
(setq kept-new-versions 10)    ;; Keep 10 new versions
(setq kept-old-versions 2)     ;; Keep 2 old versions
(setq version-control t)       ;; always use versioned backups

;;=============================================================================
;; MOUSE WHEEL -- scroll by 3 lines at a time
;;=============================================================================
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

;;=============================================================================
;; FUNCTION KEY BINDINGS -- Bob Y's preferences)
;;=============================================================================

; Editing
(global-set-key [f1]                   'kill-line)
(global-set-key [f2]                   'kill-word)
(global-set-key [f3]                   'string-rectangle)
(global-set-key [f4]                   'delete-rectangle)
(global-set-key [f5]                   'macrotimestamp)
(global-set-key [(shift f5)]           'delete-trailing-whitespace)
(global-set-key (kbd "<S-pause>")      "\M-l")
(global-set-key (kbd "<pause>")        "\M-u")
(global-set-key (kbd "<kp-enter>")     'goto-line)

; Search & replace
(global-set-key [f6]                   'find-file)
(global-set-key [(shift f6)]           'insert-file)
(global-set-key [f7]                   'save-buffer)
(global-set-key [f8]                   'isearch-forward)
(global-set-key [f9]                   'replace-string)
(global-set-key [(shift f9)]           'query-replace)
				       
; Buffers			       
(global-set-key [f10]                  'swapbuffer)
(global-set-key [f11]                  'switch-to-buffer)
(global-set-key [f12]                  'kill-this-buffer)
				       
; Modes				       
(global-set-key [(control f3)]         'c++-mode)
(global-set-key [(control f4)]         'cmake-mode)
(global-set-key [(control f5)]         'f90-mode)
(global-set-key [(control f6)]         'idlwave-mode)
(global-set-key [(control f7)]         'makefile-mode)
(global-set-key [(control f8)]         'shell-script-mode)
(global-set-key [(control f9)]         'cperl-mode)
(global-set-key [(control f10)]        'font-lock-mode)

; Ediff
(global-set-key [(shift f1)]           'ediff-files)
(global-set-key [(shift f2)]           'ediff-buffers)
(global-set-key [(shift f3)]           'fullcleanediff)

; Deletion
(global-set-key [(delete)]             "\C-d")   
(global-set-key [(control delete)]     'kill-word)
(global-set-key [(control backspace)]  'backward-kill-word)
(delete-selection-mode t)

;; Navigation and scrolling
(global-set-key [(meta n)]             'scroll-n-lines-ahead)
(global-set-key [(meta p)]             'scroll-n-lines-behind)
(global-set-key [(control tab)]        'other-window)

; Accelerate by 10 lines
(global-set-key [(control shift n)] (lambda () (interactive) (next-line 10)))
(global-set-key [(control shift p)] (lambda () (interactive) (previous-line 10)))
;; ---------- BOUNCE B/W PARENTHESES
;; bounces from one sexp "(){}[]<>" to another (ala vi's %)
;; written by Joe Casadonte (joc@netaxs.com)
(defun joc-bounce-sexp ()
  "Will bounce between matching parens just like % in vi"
  (interactive)
  (let ((prev-char (char-to-string (preceding-char)))
        (next-char (char-to-string (following-char))))
        (cond ((string-match "[[{(<]" next-char) (forward-sexp 1))
                  ((string-match "[\]})>]" prev-char) (backward-sexp 1))
                  (t (error "%s" "Not on a paren, brace, or bracket")))))
(global-set-key [(control =)] 'joc-bounce-sexp)

;;=============================================================================
;; MODES
;;=============================================================================

;; activate image mode to display images in emacs buffer (jpg, gif, tiff, ...)
;; Alternatively, you can use ! command, where command is DISPLAY, GV
(auto-image-file-mode)

;; Add path where IDLWAVE v6 is located, so that we will load that.
;; If we don't do this, then the older IDLWAVE v4.7 will load by default.
(setq load-path (cons "/usr/local/share/emacs/site-lisp" load-path))

;; Autoload modes
(autoload 'matlab-mode "matlab" "Major mode for editing .m files" t)
(autoload 'idl-mode "idl" "Major mode for editing IDL/WAVE CL .pro files" t)
(autoload 'idlwave-mode  "idlwave"  "IDLWAVE Mode"  t)

;; Load different major modes depending on the file extension
(setq auto-mode-alist
      (append '(("\\.cmake"                 . cmake-mode)
                ("\\.c$"                    . c-mode)
		("\\.C$"                    . c++-mode)
		("\\.cc$"                   . c++-mode)
		("\\.hh$"                   . c++-mode)
		("\\.hpp$"                  . c++-mode)
		("\\.cpp$"                  . c++-mode)
		("\\.h$"                    . c++-mode)
		("\\.hM$"                   . c++-mode)
		("\\.F$"                    . fortran-mode)
		("\\.H$"                    . f90-mode)
		("\\.F90"                   . f90-mode)
		("\\.kpp"                   . f90-mode)
		("\\.tex$"                  . latex-mode)
		("\\.m$"                    . matlab-mode)
		("\\.sh$"                   . shell-script-mode)
		("\\.env$"                  . shell-script-mode)
		("\\.centos7$"              . shell-script-mode)
		("\\.pl$"                   . cperl-mode)
		("\\.yaml$"                 . yaml-mode)
		("\\.yml$"                  . yaml-mode)
	       )auto-mode-alist))

;; Manually add certain configuration files to shell-script mode
(add-to-list 'auto-mode-alist '(".bashrc"               . shell-script-mode))
(add-to-list 'auto-mode-alist '(".bash_aliases"         . shell-script-mode))
(add-to-list 'auto-mode-alist '(".my_personal_settings" . shell-script-mode))

;;-----------------------------------------------------------------------------
;; IDL MODE CUSTOMIZATIONS
;;-----------------------------------------------------------------------------

;; Change the indentation preferences
(setq idlwave-main-block-indent  3         ; default  0
      idlwave-block-indent       3         ; default  4
      idlwave-end-offset        -3   )     ; default -4

;; Pad some operators with spaces (or not)
(setq idlwave-do-actions         t
      idlwave-surround-by-blank  t)

;; Indent ";" comments with the code but not ";;", ";;;", ";;;;" etc.
(setq idlwave-code-comment       ";[^;]"  )

;; Some setting can only be done from a mode hook
(add-hook 'idlwave-mode-hook
	  (lambda ()

	    ;; Turn off auto filling
	    (idlwave-auto-fill-mode 0)

	    ;; Some personal abbreviations
	    (idlwave-define-abbrev "dpf" "dialog_pickfile()"
				   (idlwave-keyword-abbrev 1))

	    ;; Pad '*' and '+'
	    (idlwave-action-and-binding "*" '(idlwave-surround 1 1))
	    (idlwave-action-and-binding "+" '(idlwave-surround 1 1))

	    ))


;; Automatically start the shell when needed - RHEA only
(setq idlwave-shell-automatic-start t)

;; Bind debugging commands with CONTROL and SHIFT modifiers
;; It replaces C-c C-d C-c
(setq idlwave-shell-debug-modifiers '(control shift))

;; Where are the online help files? -NEED CHECKING
(setq idlwave-help-directory "~/.idlwave")

;; Pop open the IDL command line shell in a separate EMACS window
(setq idlwave-shell-use-dedicated-frame t)

;; To Make C-TAB be "other window" in IDLWAVE
(require 'idlwave)
(define-key idlwave-mode-map [(control tab)] 'other-window)
(define-key idlwave-mode-map [?\M-p]         'idlwave-complete)

;; Since M-Tab is used by Windows, Linux .. and we want to keep
;; that feature, we need amother binding to 'idlwave-complete
;; (which we really want to use).  Could use ESC-p but I prefer
;; to use M-p and F4 since they are available locally. This is NOT
;; for idl-shell mode, where you simply use TAB to get completion
(define-key idlwave-mode-map [?\M-p] 'idlwave-complete)
(define-key idlwave-mode-map [f4] 'idlwave-complete)

;; Bind most useful help functions to S-F1 (for M-?) and
;; M-F1 (for C-c ?), in both modes, first file buffer...
(define-key idlwave-mode-map  [(meta f1)]   'idlwave-routine-info)
(define-key idlwave-mode-map  [(shift f1)]  'idlwave-context-help)

;; ..then for the shell buffer
(add-hook 'idlwave-shell-mode-hook
	  (lambda ()
	    (local-set-key [(meta f1)]   'idlwave-routine-info)
	    (local-set-key [(shift f1)]  'idlwave-context-help))
)

;;-----------------------------------------------------------------------------
;; FORTRAN MODE CUSTOMIZATIONS (aka Fortran 77 style)
;;
;; NOTE: For Emacs 24.4 and higher!!! (Bob Yantosca, 11 Dec 2015)
;; ===========================================================================
;; Turn off the "electric-indent-mode if it supported in this Emacs version.
;; This feature was introduced in Emacs 24.  When typing multiple comment
;; lines (esp. in Fortran mode), electric-indent would align each new comment
;; line to column 0 instead of at the previous indent level.  This meant that
;; you would have had to manually indent comments by typing spaces.
;;
;; With electric-indent-mode turned off, after hitting return, the cursor
;; will return to column 0.  You can then hit TAB to move the cursor to the
;; previous indent level and then type your comment or code.
;;
;; The default indentation behavior for Fortran mode was changed in Emacs 24.
;; Fortran-90 mode is unaffected.  Therefore, we turn off the electric-indent
;; mode only if we are in Fortran mode.
;;
;; See this web post for more information: http://emacs.stackexchange.com/questions/5939/how-to-disable-auto-indentation-of-new-lines
;;-----------------------------------------------------------------------------

(add-hook 'fortran-mode-hook
	  (function
	   (lambda ()
	     (setq
	      ;; use abbreviations (e.g.: ";s" for "stop")
	      abbrev-mode 1
	      )

             ; Turn off automatic indentation for Fortran mode only
             (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))
	     )
	   )
)

;; Make sure we have F90 mode loaded
(require 'fortran)
;
;;-----------------------------------------------------------------------------
;; F90 MODE CUSTOMIZATIONS (free-format style)
;;-----------------------------------------------------------------------------
(add-hook 'f90-mode-hook
	  (function
	   (lambda ()

	     ;; use abbreviations (e.g.: "`pr" for "print")
	     (setq  abbrev-mode 1)

             ; Turn off automatic indentation for Fortran mode only
             (when (fboundp 'electric-indent-mode) (electric-indent-mode -1))

	     )
	   )
)

;; Align comments starting with ! with the code
(fset 'smart-f90-tab
   [home ?  tab end])

;; Make sure we have F90 mode loaded
(require 'f90)

;;-----------------------------------------------------------------------------
;; SHELL SCRIPT MODE CUSTOMIZATIONS
;;-----------------------------------------------------------------------------
(add-hook 'shell-mode-hook
	  '(lambda ()
             (local-set-key [home] 'comint-bol)                ;; Home key

	     (local-set-key [up]                               ;; Cycle up
                            '(lambda () (interactive)          ;; through
                               (if (comint-after-pmark-p)      ;; command
                                   (comint-previous-input 1)   ;; history
                                 (previous-line 1))))

	     (local-set-key [down]                             ;; Cycle down
                            '(lambda () (interactive)          ;; through
                               (if (comint-after-pmark-p)      ;; command
                                   (comint-next-input 1)       ;; history
                                 (forward-line 1))))
             )
)

;;----------------------------------------------------------------------------
;; TEXT-MODE CUSTOMIZATIONS
;;-----------------------------------------------------------------------------
(add-hook 'text-mode-hook 'turn-on-auto-fill)  ;; Turn on auto-formatting

;;-----------------------------------------------------------------------------
;; CPERL-MODE CUSTOMIZATIONS
;;-----------------------------------------------------------------------------
(setq perl-indent-level 2)               ;; Number of spaces to indent
(setq perl-tab-to-comment t)             ;; Create a new comment with tab
(setq perl-electric-parens t)            ;; Add the matching ), }, ]
(setq perl-electric-keywords t)          ;; Automatic expansion of keywords
(setq perl-continued-statement-offset 2) ;; Extra indent for each sub-block

;;-----------------------------------------------------------------------------
;; CMAKE-MODE CUSTOMIZATIONS
;;
;; NOTE: Get cmake-mode.el from:
;;   https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el
;; and copy it to your ~/.emacs.d folder
;;-----------------------------------------------------------------------------
(load "~/.emacs.d/cmake-mode.el")
(require 'cmake-mode)

;;-----------------------------------------------------------------------------
;; YAML-MODE CUSTOMIZATIONS
;;
;; NOTE: Get cmake-mode.el from:
;;   See https://github.com/yoshiki/yaml-mode
;; and copy it to your ~/.emacs.d folder
;;-----------------------------------------------------------------------------
(load "~/.emacs.d/yaml-mode.el")
(require 'yaml-mode)
(add-hook 'yaml-mode-hook
    '(lambda ()
       (define-key yaml-mode-map "\C-m" 'newline-and-indent)
     )
)

;;-----------------------------------------------------------------------------
;; Enable font lock and autofill
;;-----------------------------------------------------------------------------
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)          ; GNU Emacs
    (setq font-lock-auto-fontify t))   ; XEmacs

;;-----------------------------------------------------------------------------
;; Enable YASnippets
;;-----------------------------------------------------------------------------
(add-to-list 'load-path
              "~/.emacs.d/elpa/yasnippet-0.14.0")
(require 'yasnippet)
(yas-global-mode 1)

;;=============================================================================
;; FRAME SIZE AND POSITION
;; NOTE: The default is for a screen of 1920x1200 resolution,
;; You will likely want to modify these settings if working
;; with a different resolution (e.g. on your laptop)
;;=============================================================================

;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;; %%%%% Bob Y's Coronavirus working from home preferences          
;; %%%%% Open two windows, 80 columns x 49 lines, centered on screen
(set-frame-height (selected-frame) 49)    ; 48 lines
(set-frame-width  (selected-frame) 164)   ; 163 columns
(split-window-horizontally)               ; Use two vertical windows
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;; %%%%% Bob Y's Linux Laptop preferences
;; %%%%% Open 1 window
;(set-frame-height (selected-frame) 34)      ; 34 lines
;(set-frame-width  (selected-frame) 81)      ; 80 columns
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
;; %%%%% Bob Y's working at the office preferences 
;; %%%%% Open two windows side by side, 164 columns x 72 lines
;;(set-frame-height (selected-frame) 72)      ; 72 lines, for XMing
;;(set-frame-height (selected-frame) 56)      ; 56 lines, for MobaXterm
;;(set-frame-width  (selected-frame) 164)     ; 164 columns
;;(split-window-horizontally)                 ; Use two vertical windows
;;(other-window 1)                            ; Start in the right window
;; %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

;; %%%%% Other possibilities (uncomment the one you want)

;; %%%%% Open one window, 80 columns x 60 lines, centered on screen %%%%%
;;(set-frame-height (selected-frame) 72)    ; 72 lines
;;(set-frame-width  (selected-frame) 81)    ; 80 columns
;;(set-frame-position (selected-frame) 550 30)

;; %%%%% Open two windows on top of each other, 80 columns x 72 lines %%%%%
;;(set-frame-height (selected-frame) 72)    ; 72 lines
;;(set-frame-width  (selected-frame) 80)    ; 80 columns
;;(split-window-vertically)                 ; Use two horizontal windows
;;(other-window 1)                          ; Start in the bottom window

;; %%%%% Open a shell (optional, but not really necessary) %%%%%
;(shell)                                    ; start a shell
;;(rename-buffer "shell-first")             ; rename it
;(other-window 1)                           ; move back to first window

;EOC
