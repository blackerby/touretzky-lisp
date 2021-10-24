;; 4.1
(defun make-even (n)
  (if (evenp n)
      n
      (1+ n)))

(make-even 1)
(make-even 2)

;; 4.2
(defun further (n)
  (if (> n 0)
      (1+ n)
      (1- n)))

(further 1)
(further -1)
(further 0) ; treatment of 0 depends on condition used in implementation

;; 4.3
(defun my-not (x)
  (if x
      nil
      t))

(my-not t)
(my-not '())

;; 4.4
(defun ordered (x y)
  (if (< x y)
      (list x y)
      (list y x)))

(ordered 3 4)
(ordered 4 3)

;; 4.5
(defun compare (x y)
  (cond
    ((equal x y) 'numbers-are-the-same)
    ((< x y) 'first-is-smaller)
    ((> x y) 'first-is-bigger)))

;; 4.5
(compare 9 1)       ; clause 3 evaluates to true
(compare (+ 2 2) 5) ; clause 2 evaluates to true
(compare 6 (* 2 3)) ; clause 1 evaluates

;; 4.6
(defun my-abs (x)
  (cond
    ((< x 0) (- x))
    (t x)))

(my-abs -3)
(my-abs 3)

;; 4.8

(defun emphasize3 (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t (cons 'very x))))

(emphasize3 '(long day))
(emphasize3 (emphasize3 '(long day)))

;; 4.9
(defun make-odd (x) ; corrected from book
  (cond ((not (oddp x)) (+ x 1))
        (t x)))

;; 4.10
(defun constrain (x min max)
  (cond ((< x min) min)
        ((> x max) max)
        (t x)))

(defun constrain-if (x min max)
  (if (< x min)
      min
      (if (> x max)
          max
          x)))

;; 4.11
(defun firstzero (x)
  (cond ((equal (first x) 0) 'first)
        ((equal (second x) 0) 'second)
        ((equal (third x) 0) 'third)
        (t 'none)))

(firstzero 3 0 4) ; invalid argument error

;; 4.12
(defun cycle (n)
  (cond ((equal n 99) 1)
        ((and (> n 0) (< n 99)) (1+ n))
        (t nil)))

;; 4.13
(defun howcompute (x y z)
  (cond ((equal (+ x y) z) 'sum-of)
        ((equal (* x y) z) 'product-of)
        ((equal (/ x y) z) 'quotient-of)
        ((equal (- x y) z) 'difference-of)
        (t '(beats me))))

;; 4.15
(defun geq (x y)
;  (>= x y)
  (or (> x y) (equal x y)))

;; 4.16
(defun sqr-double-divide (n)
  (cond ((and (oddp n) (> n 0)) (* n n))
        ((and (oddp n) (< n 0)) (+ n n))
        (t (/ n 2))))

;; 4.17
(defun agep (a b)
  (or (and (or (equal a 'man) (equal a 'woman)) (equal b 'adult))
      (and (or (equal a 'boy) (equal a 'girl)) (equal b 'child))))

;; 4.18
(defun play (a b)
  (cond ((and (equal a 'rock) (equal b 'scissors)) 'first-wins)
        ((and (equal b 'rock) (equal a 'scissors)) 'second-wins)
        ((and (equal a 'scissors) (equal b 'paper)) 'first-wins)
        ((and (equal b 'scissors) (equal a 'paper)) 'second-wins)
        ((and (equal a 'paper) (equal b 'rock)) 'first-wins)
        ((and (equal b 'paper) (equal a 'rock)) 'second-wins)
        (t 'tie)))

(defun play-book-solution (x y)
  (cond ((equal x y) 'tie)
        ((or (and (equal x 'rock)
                  (equal y 'scissors))
             (and (equal x 'scissors)
                  (equal y 'paper))
             (and (equal x 'paper)
                  (equal y 'rock)))
         'first-wins)
        (t 'second-wins)))

;; 4.19
(and 'x 'y 'z 'w)

(if 'x
    (if 'y
        (if 'z
            'w)))

;; had to check solutions for this one
(cond ((not 'x) nil)
      ((not 'y) nil)
      ((not 'z) nil)
      (t 'w))
;; notice use of not!!!

;; 4.20
(defun compare-if (x y)
  (if (equal x y)
      'numbers-are-the-same
      (if (< x y)
          'first-is-smaller
          'first-is-bigger)))

(defun compare-and-or (x y)
  (or (and (equal x y) 'numbers-are-the-same)
      (and (< x y) 'first-is-smaller)
      (and (> x y) 'first-is-bigger)))

;; 4.21
(defun gtest (x y)
  (or (> x y)
      (zerop x)
      (zerop y)))

(defun gtest-if (x y)
  (if (> x y)
      t
      (if (zerop x)
          t
          (if (zerop y)
              t
              nil))))

(defun gtest-if-book (x y)
  (if (> x y)
      t
      (if (zerop x)
          t
          (zerop y)))) ;; explicit use of nil not necessary

(defun gtest-cond (x y)
  (cond ((and (> x y) t) t)
        ((and (zerop x) t) t)
        ((and (zerop y) t) t)
        (t nil)))

(defun gtest-cond-book (x y)
  (cond ((> x y) t)
        ((zerop x) t)
        (t (zerop y))))

;; 4.22
(defun boilingp (temp scale)
  (cond ((equal scale 'celsius) (> temp 100))
        ((equal scale 'fahrenheit) (> temp 212))))

(defun boilingp-2 (temp scale)
  (or (and (equal scale 'celsius) (> temp 100))
      (and (equal scale 'fahrenheit) (> temp 212))))

(defun boilingp-3 (temp scale)
  (if (equal scale 'celsius)
      (> temp 100)
      (if (equal scale 'fahrenheit)
          (> temp 212))))

;; remaining exercises done with pencil and paper
