#lang racket

;; Define a function to calculate the sum of multiples of 3 or 5 below a given limit
(define (sum-of-multiples limit)
  (define (multiple? n) (or (= (modulo n 3) 0) (= (modulo n 5) 0)))
  (define (sum-helper n acc)
    (if (>= n limit)
        acc
        (sum-helper (+ n 1) (if (multiple? n) (+ acc n) acc))))
  (sum-helper 1 0))

;; Define the limit
(define limit 1000)

;; Calculate the result
(define result (sum-of-multiples limit))

;; Print the result
(displayln (format "The sum of all multiples of 3 or 5 below ~a is: ~a" limit result))
