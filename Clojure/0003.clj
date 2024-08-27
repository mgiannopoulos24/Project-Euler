(ns largest-prime-factor.core)

(defn largest-prime-factor [n]
  (let [remove-factors (fn [n divisor]
                         (loop [num n
                                d divisor]
                           (if (zero? (mod num d))
                             (recur (/ num d) d)
                             [num d])))
        [n _] (loop [num n
                     divisor 2]
                (if (zero? (mod num divisor))
                  (recur (first (remove-factors num divisor)) divisor)
                  (if (= divisor 2)
                    (recur num 3)
                    [num divisor])))]
    (loop [num n
           divisor 3
           largest divisor]
      (if (> (* divisor divisor) num)
        (if (> num largest) num largest)
        (if (zero? (mod num divisor))
          (recur (/ num divisor) (+ divisor 2) (max divisor largest))
          (recur num (+ divisor 2) largest))))))

(defn -main []
  (let [number 600851475143]
    (println (str "The largest prime factor of " number " is " (largest-prime-factor number)))))

;; Run main
(-main)