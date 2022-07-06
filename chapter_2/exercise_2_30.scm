#| Define a procedure square-tree analogous to the square-list procedure of Exercise 2.21.at is, squaretree should behave as
follows:

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))
(1 (4 (9 16) 25) (36 49))

Define square-tree both directly (i.e., without using any higher-order procedures) and also by using map and recursion. |#

(define (square-tree tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree))
                    (square-tree (cdr tree))))))


(define (map proc items)
  (if (null? items)
      '()
      (cons (proc (car items))
            (map proc (cdr items)))))


;; test

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))