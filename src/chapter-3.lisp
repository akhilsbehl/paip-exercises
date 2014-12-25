;;;; Exercise 3.1. Now why would I need multiple lambdas?
((lambda (x) (+ x (* x x))) 6)

;;;; Exercise 3.2. Hmm... dunno... `reverse` + `append`?

(defun print-dotted (expr)
  "Exercise 3.3: Print an arbitrary expression in the dotted pair notation. I
  understand this to be: print the cons structure of the expression list."
  (cond ((null expr) (princ nil))
        ((atom expr) (princ expr))
        (t (progn
             (princ "(")
             (print-dotted (car expr))
             (princ " . ")
             (print-dotted (cdr expr))
             (princ ")"))))
  nil)

(print-dotted nil)
(print-dotted 'a)
(print-dotted '(a b c))
(print-dotted '(a b (c d) e))

()
