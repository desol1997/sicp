;; Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

(define (square x) (* x x))


(define (sum-of-squares x y)
  (+ (square x) (square y)))


(define (sum-of-squares-two-larger-numbers x y z)
  (cond ((and (>= x y) (>= y z)) (sum-of-squares x y))
        ((and (>= x z) (>= z y)) (sum-of-squares x z))
        (else (sum-of-squares y z))))


;; test

(sum-of-squares-two-larger-numbers 2 3 4)