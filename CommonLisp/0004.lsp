(defun palindrome-p (n)
  "Check if a number is a palindrome."
  (let ((str (write-to-string n)))
    (string= str (reverse str))))

(defun largest-palindrome ()
  "Find the largest palindrome made from the product of two 3-digit numbers."
  (let ((max-palindrome 0))
    (loop for i from 999 downto 100 do
      (loop for j from i downto 100 do
        (let ((product (* i j)))
          (when (and (> product max-palindrome) (palindrome-p product))
            (setf max-palindrome product)))))
    max-palindrome))

;; Run the function and print the result
(format t "The largest palindrome made from the product of two 3-digit numbers is: ~a~%" (largest-palindrome))