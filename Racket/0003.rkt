#lang racket

(define (largest-prime-factor n)
  (define (divide-out n factor)
    (if (= (remainder n factor) 0)
        (divide-out (/ n factor) factor)
        n))
  
  (define (lp-helper n current)
    (cond [(= n 1) current]
          [(> (* current current) n) n]
          [(= (remainder n current) 0)
           (lp-helper (divide-out n current) current)]
          [else (lp-helper n (+ current 2))]))
  
  ;; Remove all factors of 2
  (let ([n-after-2 (divide-out n 2)])
    (if (= n-after-2 1)
        2
        (lp-helper n-after-2 3))))

(displayln (format "The largest prime factor of 600851475143 is ~a"
                   (largest-prime-factor 600851475143)))