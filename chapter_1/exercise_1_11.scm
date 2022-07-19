#| A function f is defined by the rule that f(n) = n if n < 3 and и f(n) = f(n − 1) + f(n − 2) + f(n − 3) if n >= 3. Write
a procedure that computes f by means of a recursive process. Write a procedure that computes f by means of an iterative
process. |#

;; recursive process

(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
         (f (- n 2))
         (f (- n 3)))))


;; iterative process

(define (f n)
  (if (< n 3)
      n
      (f-iter 2 1 0 n)))


(define (f-iter a b c counter)
  (if (< counter 3)
      a
      (f-iter (+ a b c) a b (- counter 1))))


;; tests

(f 0)
(f 1)
(f 2)
(f 3)
(f 4)
(f 5)
