(defun cross-product (func alist blist)
  "Exercise 2.4: Cross-product of two lists over a given function."
  (cond
    ((or (null alist) (null blist)) nil)
    ((not (equalp (length alist) (length blist))) nil)
    (t (mapcan (lambda (b)
                 (mapcar (lambda (a) (funcall func a b)) alist)) blist))))

(defun do-cross-product (func alist blist)
  "Exercise 2.4: Cross-product of two lists over a given function.
  A different approach based on iteration. Both are functionally identical."
  (cond
    ((or (null alist) (null blist)) nil)
    ((not (equalp (length alist) (length blist))) nil)
    (t (let ((result nil))
         (dolist (b blist (nreverse result))
           (dolist (a alist)
             (push (funcall func a b) result)))))))
