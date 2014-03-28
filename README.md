GPA Calculator - Racket
=======================

A GPA calculator coded in Racket catered to Northeastern University's grading system

Format
------

A semester's worth of grades is made from creating a grade structure, which consists of two fields: a letter grade and the number of corresponding credits of that class. This structure should then be placed inside a list.

```racket
(define spring13 (list (make-grade B+ 4)  ;; Cup Theory
                       (make-grade B+ 4)  ;; Evolution of Donuts
                       (make-grade B+ 1)  ;; Evolution of Donuts Lab
                       (make-grade B+ 1)  ;; Fundamentals of Potato Peeling
                       (make-grade A- 4)  ;; 12th Century Cups
                       (make-grade A 4))) ;; Elephant Culture
                                          ;; __________________________________
                                          ;; Spring 2013 GPA: 3.555
```
