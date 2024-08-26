(defun sum-even-fibonacci (limit)
  (let ((a 1)
        (b 2)
        (sum 0))
    (loop while (<= a limit)
          do (when (evenp a)
               (incf sum a))
          (rotatef a b)
          (incf b a))
    sum))

(defun main ()
  (let ((limit 4000000))
    (format t "The sum of the even-valued terms is: ~D~%" (sum-even-fibonacci limit))))

;; Call the main function 
(main)
