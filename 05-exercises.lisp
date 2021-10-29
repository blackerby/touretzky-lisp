;; 5.1
(defun good-style (p)
  (let ((q (+ p 5)))
    (list 'result 'is q)))

;;  5.6
;;; a
(defun throw-die ()
  (1+ (random 6)))
;;; b
(defun throw-dice ()
  (list (throw-die) (throw-die)))
;;; c
(defun snake-eyes-p (athrow)
  (equal athrow '(1 1)))
(defun boxcars-p (athrow)
  (equal athrow '(6 6)))
;;; d
(defun instant-win-p (athrow)
  (let ((sum (+ (first athrow) (second athrow))))
    (or (equal sum 7)
        (equal sum 11))))
(defun instant-loss-p (athrow)
  (let ((sum (+ (first athrow) (second athrow))))
    (or (equal sum 2)
        (equal sum 3)
        (equal sum 12))))
;;; e
(defun say-throw (athrow)
  (let ((sum (+ (first athrow) (second athrow))))
    (cond ((equal sum 2) 'SNAKE-EYES)
          ((equal sum 12) 'BOXCARS)
          (t sum))))
;;; f
(defun craps ()
  (let* ((athrow (throw-dice))
         (first-die (first athrow))
         (second-die (second athrow))
         (result (say-throw athrow)))
    (append (list 'throw first-die 'and second-die '--)
            (cond ((instant-win-p athrow) (list result '-- 'you 'win))
                  ((instant-loss-p athrow) (list result '-- 'you 'lose))
                  (t (list 'your 'point 'is result))))))
;;; g
(defun try-for-point (point)
  (let* ((athrow (throw-dice))
         (first-die (first athrow))
         (second-die (second athrow))
         (result (+ first-die second-die)))
    (append (list 'throw first-die 'and second-die '--)
            (cond ((equal point result) (list result '-- 'you 'win))
                  ((equal result 7) (list result '-- 'you 'lose))
                  (t (list result '-- 'throw 'again))))))
