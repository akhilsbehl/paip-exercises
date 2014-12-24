(defun cross-product (func alist blist)
  "Exercise 2.4: Cross-product of a list of argument lists. Combine all is
  simply this function itself since it is a cross-product on the function
  append."
  (cond
    ((or (null alist) (null blist)) nil)
    ((not (equalp (length alist) (length blist))) nil)
    (t (mapcan (lambda (x)
                 (mapcar (lambda (y) (funcall func x y)) alist)) blist))))
