; Fibonacci function written for r5rs
(define (fib num)
 (cond ( (= num 0) 0)
       ( (= num 1) 1)
       (else
         (+ (fib (- num 1)) (fib (- num 2)))
       )
 )
)

(display "Fib for 40:\n")
(fib 40)

