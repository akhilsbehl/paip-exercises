(defun cross-product (func alist blist)
  "Exercise 2.4: Cross-product of two lists over a given function."
  (cond
    ((or (null alist) (null blist)) nil)
    ((not (equalp (length alist) (length blist))) nil)
    (t (mapcan (lambda (x)
                 (mapcar (lambda (y) (funcall func x y)) alist)) blist))))
