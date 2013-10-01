GPA Calculator - Racket
=======================

A GPA calculator coded in Racket catered to Northeastern University's grading system

Format
------

A semester's worth of grades is made from creating a grade structure, which consists of two fields: a letter grade and the number of corresponding credits of that class. This structure should then be placed inside a list.

```racket
(define fall12 (list (make-grade A- 4)   ;; Quantum Physics 3501
                     (make-grade A  1)   ;; Quantum Physics Lab 3501
                     (make-grade B- 4)   ;; Physics
                     (make-grade B  4)   ;; Theory of Computation
                     (make-grade B  1)   ;; Physics Lab
                     (make-grade A- 4))) ;; East Asian Studies
```
