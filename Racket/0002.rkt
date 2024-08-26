#lang racket

; Function to generate the sum of even-valued Fibonacci numbers up to a limit
(define (sum-even-fibonacci limit)
  (define (fib a b)
    (cond
      [(> a limit) 0]
      [(even? a) (+ a (fib b (+ a b)))]
      [else (fib b (+ a b))]))
  
  (fib 1 2))

; Define the limit (4 million)
(define limit 4000000)

; Calculate the sum of even-valued Fibonacci numbers
(define result (sum-even-fibonacci limit))

; Print the result
(printf "The sum of the even-valued terms is: ~a\n" result)
