;;;; PAIP Exercise 1.4
(defun count-anywhere (expra exprb)
  "Count how many times an expression appears in another."
  (cond ((equalp expra exprb) 1)
        ((atom exprb) 0)
        (t (+ (count-anywhere expra (car exprb))
              (count-anywhere expra (cdr exprb))))))

(count-anywhere 'a '(a (a b) c)) vs
(count-anywhere '(+ a b) '(a (+ a b) c)).

;;;; PAIP Exercise 1.5
(defun dot-product (lista listb)
  "Vectors only. Will add even non-confirming vectors by truncating to the
  smaller one."
  (apply #'+ (mapcar #'* lista listb)))
