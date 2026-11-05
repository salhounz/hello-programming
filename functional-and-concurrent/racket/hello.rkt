#lang racket

;;
;;    Type Systems & Variables
;;
;; define names values; let creates lexical bindings, and types are checked dynamically here.
(define score 10)
(define language "Racket")
(define updated-score (+ score 5))

;;
;;    Control Flow Operations
;;
;; if and cond choose expressions; for iterates through sequences.
(define result (if (>= updated-score 10) 'pass 'retry))
(define total (for/sum ([value '(1 2 3)]) value))

;;
;;    Execution Blocks
;;
;; Functions are definitions with argument lists and lexical scope.
(define (add left right) (+ left right))
(define sum (let ([local 2]) (add local 3)))

;;
;;    Code Health & Documentation
;;
;; Use semicolon notes, #| |# block comments, and #; to skip a form.
; A single-line comment.
#| A multi-line
   comment. |#
#;(this-form-is-not-evaluated)

;;
;;    Built-In Collections
;;
;; Lists, vectors, hashes, and sets cover sequential and keyed data.
(define values (list 1 2 3))
(define point (vector 10 20))
(define inventory (hash 'apples 3))
(define unique (set 1 1 2))

;;
;;    Data Mutability
;;
;; Persistent updates create new values; set! changes a binding deliberately.
(define updated (hash-set inventory 'apples 4))
(define copied (append values (list 4)))

;;
;;    Access & Encapsulation
;;
;; Lexical closures hide state; module provide declarations choose exported APIs.
(define (make-counter)
  (let ([count 0])
    (lambda () (set! count (add1 count)) count)))
(define increment (make-counter))
(define count (increment))

;;
;;    Design Paradigms & Patterns
;;
;; Higher-order operations compose transformations over immutable sequences.
(define doubled (map (lambda (value) (* value 2)) values))

;;
;;    Memory Management
;;
;; The runtime manages object memory; port helpers delimit resource lifetime.
(define first-character
  (call-with-input-string "sample" read-char))

;;
;;    Concurrency & Parallelism
;;
;; Threads can communicate through channels; CPU parallelism requires suitable facilities such as places.
(define answers (make-channel))
(define worker (thread (lambda () (channel-put answers 42))))
(define answer (channel-get answers))
(thread-wait worker)

;;
;;    Performance Optimization
;;
;; Use suitable sequence operations and avoid unnecessary intermediate lists.
(define squared-total (for/sum ([value (in-list values)]) (* value value)))

(displayln "Hello, World!")
