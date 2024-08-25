(defn sum-of-multiples [limit]
  (reduce + (for [i (range 1 limit)
                  :when (or (zero? (mod i 3))
                             (zero? (mod i 5)))]
              i)))

(defn -main []
  (let [limit 1000
        result (sum-of-multiples limit)]
    (println (format "The sum of all multiples of 3 or 5 below %d is: %d" limit result))))

;; Run the main function
(-main)
