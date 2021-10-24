;; 3.22.c

(defun myfun (a b)
  (list (list a) b))

(myfun 'alpha 'beta)

;; 3.22.d
(defun firstp (s l)
  (equal s (first l)))

(firstp 'foo '(foo bar baz))
(firstp 'boing '(foo bar baz))

;; 3.22.e
(defun mid-add1 (l)
  (list (first l) (1+ (second l)) (third l)))

(mid-add1 '(take 2 cookies))

;; 3.22.f
(defun f-to-c (temp)
  (/ (* 5 (- temp 32)) 9))

;; book solution
(defun f-to-c-book (temp)
  (* (- temp 32.0) 5/9))

(f-to-c 32)
(f-to-c 212)
(f-to-c 33)

(f-to-c-book 32)
(f-to-c-book 212)
(f-to-c-book 33)

(defun foo (x) (+ 1 (zerop x))) ;; tries to add 1 to the wrong type (symbol t or nil)
(foo 5) ; running this will cause an error
