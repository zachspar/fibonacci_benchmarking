; Fibonacci function written for r5rs
(define (fib num)
 (cond ( (= num 0) 0)
       ( (= num 1) 1)
       (else
         (+ (fib (- num 1)) (fib (- num 2)))
       )
 )
)

; see run.pl as to how this works :) haha
; reads num from input, fib is called on this number
(fib
 (read (current-input-port))
)

