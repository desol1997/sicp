#| A binary mobile consists of two branches, a left branch and a right branch. Each branch is a rod of a certain length, from
which hangs either a weight or another binary mobile. We can represent a binary mobile using compound data by constructing it
from two branches (for example, using list): |#

(define (make-mobile left right)
  (list left right))


#| A branch is constructed from a length (which must be a number) together with a structure, which may be either a number
(representing a simple weight) or another mobile: |#

(define (make-branch length structure)
  (list length structure))


#| a. Write the corresponding selectors left-branch and right-branch, which return the branches of a mobile, and branch-length
and branch-structure, which return the components of a branch. |#

(define (left-branch mobile)
  (car mobile))


(define (right-branch mobile)
  (car (cdr mobile)))


(define (branch-length branch)
  (car branch))


(define (branch-structure branch)
  (car (cdr branch)))


;; b. Using your selectors, define a procedure total-weight that returns the total weight of a mobile.

(define (branch-weight branch)
    (if (pair? (branch-structure branch))
        (total-weight (branch-structure branch))
        (branch-structure branch)))


(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))


#| c. A mobile is said to be balanced if the torque applied by its top-le branch is equal to that applied by its top right
branch (that is, if the length of the le rod multiplied by the weight hanging from that rod is equal to the corresponding
product for the right side) and if each of the submobiles hanging off its branches is balanced. Design a predicate that tests
whether a binary mobile is balanced. |#

(define (torque branch)
  (* (branch-length branch) (branch-weight branch)))


(define (branch-balanced? branch)
  (if (pair? (branch-structure branch))
      (balanced? (branch-structure branch))
      #t))


(define (balanced? mobile)
  (and (= (torque (left-branch mobile))
          (torque (right-branch mobile)))
       (branch-balanced? (left-branch mobile))
       (branch-balanced? (right-branch mobile))))


;; tests

(define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
(define b (make-mobile (make-branch 2 3) (make-branch 4 5)))
(total-weight a)
(total-weight b)
(balanced? a)
(balanced? b)
