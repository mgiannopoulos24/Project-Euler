(defn fibonacci-seq []
  (let [fib (fn fib [a b]
              (lazy-seq (cons a (fib b (+ a b)))))]
    (fib 1 2)))

(defn sum-even-fibonacci [limit]
  (->> (fibonacci-seq)
       (take-while #(< % limit))
       (filter even?)
       (reduce +)))

(defn -main []
  (let [limit 4000000
        sum (sum-even-fibonacci limit)]
    (println "The sum of the even-valued terms is:" sum)))

;;Run the main function
(-main)
