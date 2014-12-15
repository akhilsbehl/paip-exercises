(defun cross-two (alist blist)
  (let ((retval nil))
    (dolist (a alist (nreverse retval))
      (dolist (b blist)
        (push (cons a (if (listp b) b (list b))) retval)))))

(defun cross-product (arg-lists combiner)
  "Exercise 2.4: Cross-product of a list of argument lists."
  (cond
    ((null arg-lists) nil)
    ((equalp 1 (length arg-lists)) (first arg-lists))
    (t (reduce #'cross-two arg-lists :from-end t))))
