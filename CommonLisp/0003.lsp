(defun largest-prime-factor (n)
  (let ((largest 0))
    ;; Remove all factors of 2
    (loop while (zerop (mod n 2))
          do (setq largest 2)
             (setq n (/ n 2)))
    
    ;; Remove all factors of odd numbers
    (loop for i from 3 to (sqrt n) by 2
          while (<= (* i i) n)
          do (loop while (zerop (mod n i))
                do (setq largest i)
                   (setq n (/ n i))))
    
    ;; If n is a prime number greater than 2
    (if (> n 2)
        (setq largest n))
    
    largest))

(defun main ()
  (let ((number 600851475143))
    (format t "The largest prime factor of ~A is ~A~%" number (largest-prime-factor number))))

;; Call the main function to execute the code
(main)
