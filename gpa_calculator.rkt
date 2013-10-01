;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname |gpa calculator|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ())))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; GPA CALCULATOR - By: Jonathan Chiu
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;;|| DATA DEFINITIONS
;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;; A Letter is one of: A,  A-, 
;;                     B+, B, B-,
;;                     C+, C, C-, 
;;                     D+, D, D-,
;;                     F
;; You may change these to your liking to fit your
;; school's letter to number equivalencies

;; Northeastern University
(define A  4.000)
(define A- 3.667)
(define B+ 3.333)
(define B  3.000)
(define B- 2.667)
(define C+ 2.333)
(define C  2.000)
(define C- 1.667)
(define D+ 1.333)
(define D  1.000)
(define D- 0.667)
(define F  0.000)

#|

;; Standard
(define A  4.000)
(define A- 3.7)
(define B+ 3.3)
(define B  3.000)
(define B- 2.7)
(define C+ 2.3)
(define C  2.000)
(define C- 1.7)
(define D+ 1.3)
(define D  1.000)
(define D- 0.7)
(define F  0.000)

|#

;; A Grade is one a (make-grade (Letter Number))
;; FYI, credits is the number of credits for that particular course
(define-struct grade (letter credits))

#|

To make a grade list, start with (list (make-grade...)).
For each make-grade, put the letter grade that you got for the course
and the number of credits you got for that course.

|#

;; Fall 2012 Grades
(define fall12 (list (make-grade A- 4)   ;; East Asian Studies
                     (make-grade A  1)   ;; Overview 1
                     (make-grade B- 4)   ;; Discrete
                     (make-grade B  4)   ;; Fundies I
                     (make-grade B  1)   ;; Fundies Lab
                     (make-grade A- 4))) ;; English
                                         ;; __________________________________
                                         ;; Fall 2012 GPA: 3.278
;; Spring 2013 Grades
(define spring13 (list (make-grade B+ 4)  ;; Logic and Computation
                       (make-grade B+ 4)  ;; Fundies II
                       (make-grade B+ 1)  ;; Fundies II Lab
                       (make-grade B+ 1)  ;; Logic and Computation Lab
                       (make-grade A- 4)  ;; Calculus I For Sci/Eng
                       (make-grade A 4))) ;; Backgrounds of Chinese Culture
                                          ;; __________________________________
                                          ;; Spring 2013 GPA: 3.555


;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
;;|| FUNCTIONS (USE NEU-GPA TO CALCULATE)
;;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;; qpt-calc : [Listof Grades] -> [List of Number]
;; calculates the quality points of each course and makes a list out of them

(define (qpt-calc log)
  (cond [(empty? log) (list 0)]
        [else (local [(define g (grade-letter (first log)))
                      (define qpts (cons (* g (grade-credits (first log)))
                                         (qpt-calc (rest log))))]
                      (cond [(or (eq? g A)
                                 (eq? g A-)
                                 (eq? g B+) 
                                 (eq? g B) 
                                 (eq? g B-) 
                                 (eq? g C+)
                                 (eq? g C) 
                                 (eq? g C-) 
                                 (eq? g D+)
                                 (eq? g D-)
                                 (eq? g F)) qpts]))]))

;; total-credit-hours : [Listof Grades] -> Number
;; calculates the total number of credit hours for courses taken

(define (total-credit-hours log)
  (cond [(empty? log) 0]
        [else (+ (grade-credits (first log))
                 (total-credit-hours (rest log)))]))

;; neu-gpa : [Listof Grades] -> Number
;; calculates your GPA for the semester
;; USE THIS FUNCTION TO CALCULATE TOTAL GPA FOR THE SEMESTER

(define (neu-gpa log)
  (/ (apply + (qpt-calc log)) (total-credit-hours log)))




















