(defn palindrome? [n]
  "Check if a number is a palindrome."
  (let [s (str n)]
    (= s (apply str (reverse s)))))

(defn largest-palindrome []
  "Find the largest palindrome made from the product of two 3-digit numbers."
  (loop [i 999
         max-palindrome 0]
    (if (< i 100)
      max-palindrome
      (let [products (for [j (range i 99 -1)
                           :when (palindrome? (* i j))]
                       (* i j))
            new-max (reduce max max-palindrome products)]
        (recur (dec i) new-max)))))

;; Run the function and print the result
(println "The largest palindrome made from the product of two 3-digit numbers is:" (largest-palindrome))