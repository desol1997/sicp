#| Abstract your answer to Exercise 2.30 to produce a procedure tree-map with the property that squaretree could be defined as

(define (square-tree tree) (tree-map square tree)) |#

(define (tree-map proc tree-items)
  (cond ((null? tree-items) '())
        ((not (pair? tree-items)) (proc tree-items))
        (else (cons (tree-map proc (car tree-items))
                    (tree-map proc (cdr tree-items))))))


(define (square x) (* x x))


(define (square-tree tree)
  (tree-map square tree))


;; test

(square-tree
  (list 1
        (list 2 (list 3 4) 5)
        (list 6 7)))