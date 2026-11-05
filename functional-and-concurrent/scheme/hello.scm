(use-modules (ice-9 threads))

;;
;;    Type Systems & Variables
;;
;; define names a binding and let introduces lexical locals.
(define score 10)
(define language "Scheme")
(define updated-score (let ((bonus 5)) (+ score bonus)))

;;
;;    Control Flow Operations
;;
;; if chooses an expression result; named let expresses a recursive loop.
(define result (if (>= updated-score 10) 'pass 'retry))
(define total (let loop ((items '(1 2 3)) (sum 0))
  (if (null? items) sum (loop (cdr items) (+ sum (car items))))))

;;
;;    Execution Blocks
;;
;; Procedures and lambdas organize reusable calculations.
(define (add left right) (+ left right))
(define sum (add 2 3))

;;
;;    Code Health & Documentation
;;
;; Semicolons introduce comments; use adjacent lines for portable multi-line notes.
; A single-line comment.
; A second line explains the procedure contract.

;;
;;    Built-In Collections
;;
;; Lists and vectors are core collections; Guile hash tables provide keyed storage.
(define values (list 1 2 3))
(define point (vector 10 20))
(define inventory (make-hash-table))
(hash-set! inventory 'apples 3)

;;
;;    Data Mutability
;;
;; set! changes a binding; construct fresh lists when an independent value is needed.
(define copied (map (lambda (value) value) values))
(set! copied (cons 0 copied))

;;
;;    Access & Encapsulation
;;
;; Closures retain lexical state while exposing a procedure interface.
(define (make-counter)
  (let ((count 0))
    (lambda () (set! count (+ count 1)) count)))
(define increment (make-counter))
(define count (increment))

;;
;;    Design Paradigms & Patterns
;;
;; Functional transformations use procedures as arguments without changing the input.
(define doubled (map (lambda (value) (* value 2)) values))

;;
;;    Memory Management
;;
;; The implementation manages object memory; port helpers delimit stream lifetimes.
(define first-character
  (call-with-input-string "sample" (lambda (port) (read-char port))))

;;
;;    Concurrency & Parallelism
;;
;; Guile's thread extension starts work and join-thread waits for completion.
(define worker (call-with-new-thread (lambda () 42)))
(define answer (join-thread worker))

;;
;;    Performance Optimization
;;
;; Tail-recursive loops avoid accumulating pending calls when written in tail position.
(define (sum-list items)
  (let loop ((rest items) (sum 0))
    (if (null? rest) sum (loop (cdr rest) (+ sum (car rest))))))

(display "Hello, World!")
(newline)
