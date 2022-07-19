#| The following pattern of numbers is called Pascal’s triangle.

    1
   1 1
  1 2 1
 1 3 3 1
1 4 6 4 1
  . . .

The numbers at the edge of the triangle are all 1, and each number inside the triangle is the sum of the two numbers above it.
Write a procedure that computes elements of Pascal’s triangle by means of a recursive process. |#


(define (pascal-triangle-element row col)
  (cond ((< row col) #f)
        ((or (= row col)
             (= col 0)) 1)
        (else (+ (pascal-triangle-element (- row 1) (- col 1))
                 (pascal-triangle-element (- row 1) col)))))


;; tests

(pascal-triangle-element 0 0)
(pascal-triangle-element 2 1)
(pascal-triangle-element 3 2)
(pascal-triangle-element 4 2)
