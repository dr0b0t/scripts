;; Twitter$BMQ%-!<%P%$%s%I@_Dj(B

(defun switch-to-twitter1-mode ()
  (interactive)
  (twitter1-mode))
(defun switch-to-twitter2-mode ()
  (interactive)
  (twitter2-mode))
(defun switch-to-twitter3-mode ()
  (interactive)
  (twitter3-mode))
(defun switch-to-twitter4-mode ()
  (interactive)
  (twitter4-mode))
(defun switch-to-twitter5-mode ()
  (interactive)
  (twitter5-mode))
(defun switch-to-twitter6-mode ()
  (interactive)
  (twitter6-mode))
(defun switch-to-twitter-all-mode-left ()
  (interactive)
  (split-one-window-p)
  (split-window-vertically)
  (twitter1-mode)
  (split-window-vertically)
  (windmove-down)
  (twitter2-mode)
  (windmove-down)
  (twitter3-mode)
  (split-window-vertically)
  (windmove-down)
  (twitter4-mode)
  (windmove-right)
  (split-window-vertically)
  (split-window-vertically)
  (twitter5-mode)
  (windmove-down)
  (twitter6-mode)
  (windmove-down))
(defun switch-to-twitter-all-mode-up ()
  (interactive)
  (split-window-vertically)
  (twitter1-mode)
  (split-window-vertically)
  (split-window-horizontally)
  (windmove-right)
  (twitter2-mode)
  (windmove-left)
  (windmove-down)
  (twitter3-mode)
  (split-window-horizontally)
  (windmove-right)
  (twitter4-mode)
  (windmove-down)
  (split-window-vertically)
  (split-window-horizontally)
  (twitter5-mode)
  (windmove-right)
  (twitter6-mode)
  (windmove-down))
(defun switch-to-twitter-all-mode-center ()
  (interactive)
  (twitter6-mode)
  (twitter1-mode)
  (split-window-vertically)
  (split-window-horizontally)
  (windmove-right)
  (twitter2-mode)
  (windmove-left)
  (windmove-down)
  (twitter3-mode)
  (split-window-horizontally)
  (windmove-right)
  (twitter4-mode)
  (windmove-left)
  (split-window-vertically)
  (windmove-down)
  (twitter5-mode)
  (windmove-right)
  (split-window-vertically)
  (windmove-down)
  (twitter6-mode))
(define-key global-map "\C-c\C-c\ 1" 'switch-to-twitter1-mode)
(define-key global-map "\C-c\C-c\ 2" 'switch-to-twitter2-mode)
(define-key global-map "\C-c\C-c\ 3" 'switch-to-twitter3-mode)
(define-key global-map "\C-c\C-c\ 4" 'switch-to-twitter4-mode)
(define-key global-map "\C-c\C-c\ 5" 'switch-to-twitter5-mode)
(define-key global-map "\C-c\C-c\ 6" 'switch-to-twitter6-mode)
(define-key global-map "\C-c\C-c\ 7" 'switch-to-twitter-all-mode-up)
(define-key global-map "\C-c\C-c\ 8" 'switch-to-twitter-all-mode-center)
(define-key global-map "\C-c\C-c\ 9" 'switch-to-twitter-all-mode-left)

;; Local Variables:
;; mode : emacs-lisp
;; coding : euc-jp-unix
;; End:
