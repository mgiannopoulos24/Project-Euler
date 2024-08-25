(defun sum-of-multiples (limit)
  "Return the sum of all natural numbers below LIMIT that are multiples of 3 or 5."
  (let ((sum 0))
    (dotimes (i limit sum)
      (when (or (zerop (mod i 3))
                 (zerop (mod i 5)))
        (incf sum i)))))

;; Usage
(format t "The sum of all multiples of 3 or 5 below 1000 is: ~a~%" (sum-of-multiples 1000))
