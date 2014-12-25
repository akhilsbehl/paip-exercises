;;;; Exercise 3.1. Now why would I need multiple lambdas?
((lambda (x) (+ x (* x x))) 6)

;;;; Exercise 3.2. Hmm... dunno... `reverse` + `append`?

(defun print-dotted (expr)
  "Exercise 3.3: Print an arbitrary expression in the dotted pair notation. I
  understand this to be: print the cons structure of the expression list.
  NB: Will run into trouble with circular structures."
  (cond ((atom expr) (princ expr))
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

(defun print-special (expr)
  "Exercise 3.4: Print dotted when necessary otherwise print regularly. I am
  implementing this to be: print-dotted if cdr of the last element is an atom
  instead of nil."
  (cond ((null (cdr (last expr))) (print expr))
        (t (print-dotted expr))))

;;;; Exercise 3.5 seemed like an interesting problem but too vague for a
;;;; solution to be implemented. Even the solution given is too limited.

(defun length-by-reduce (alist)
  "Exercise 3.9: Find length of a list using reduce."
  (reduce #'+ (mapcar #'(lambda (x) 1) alist)))

;;;; Exercise 3.11: `acons`.

(defun format-to-sentence (words)
  "Exercise 3.12: Format in sentence case."
  (format t "~@(~a~) ~{~a~^ ~}." (first words) (rest words)))

(format-to-sentence '("asb" "is" "a" "very" "good" "boy"))
