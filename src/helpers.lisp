(defmacro timeit ((&key
                    (to-stream *standard-output*)
                    (with-runs 1))
                  &body body)
  "Note that this function may barf if you are depending on a single evaluation
  and choose with-runs to be greater than one. But I guess that will be the
  caller's mistake instead."
  (let ((start-time (gensym))
        (stop-time (gensym))
        (temp (gensym))
        (retval (gensym)))
    `(let ((,start-time (get-internal-run-time))
           (,retval (let ((,temp))
                      (dotimes (i ,with-runs ,temp)
                        (setf ,temp ,@body))))
           (,stop-time (get-internal-run-time)))
       (format ,to-stream
               "~CTime spent in expression over ~:d iterations: ~f seconds.~C"
               #\linefeed ,with-runs
               (/ (- ,stop-time ,start-time)
                  internal-time-units-per-second)
               #\linefeed)
       ,retval)))
