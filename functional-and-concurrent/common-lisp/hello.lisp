;;
;;    Type Systems & Variables
;;
;; let creates lexical bindings; defparameter defines a special variable by convention named with *.
(defparameter *score* 10)
(incf *score* 5)
(defparameter *language* "Common Lisp")

;;
;;    Control Flow Operations
;;
;; if returns a value; loop and dolist express iteration.
(defparameter *result* (if (>= *score* 10) :pass :retry))
(dolist (value (list 1 2 3)) (incf *score* value))

;;
;;    Execution Blocks
;;
;; defun declares a function and let provides local bindings.
(defun add (left right) (+ left right))
(defparameter *sum* (let ((local 2)) (add local 3)))

;;
;;    Code Health & Documentation
;;
;; Semicolons mark line comments; #| |# supports block comments and functions can have docstrings.
; A line comment.
#| A multi-line
   block comment. |#
(defun square (value)
  "Return the square of VALUE."
  (* value value))

;;
;;    Built-In Collections
;;
;; Lists are linked sequences, vectors are indexed, and hash tables map keys.
(defparameter *values* (list 1 2 3))
(defparameter *point* (vector 10 20))
(defparameter *inventory* (make-hash-table :test 'equal))
(setf (gethash "apples" *inventory*) 3)

;;
;;    Data Mutability
;;
;; copy-list copies the list spine; nested objects remain shared.
(defparameter *copied* (copy-list *values*))
(setf (first *copied*) 99)
(assert (= (first *values*) 1))

;;
;;    Access & Encapsulation
;;
;; Lexical closures can hide state without publishing its storage.
(defun make-counter ()
  (let ((count 0))
    (lambda () (incf count))))
(defparameter *increment* (make-counter))
(assert (= (funcall *increment*) 1))

;;
;;    Design Paradigms & Patterns
;;
;; Higher-order functions and generic operations support several programming paradigms.
(defparameter *doubled* (mapcar (lambda (value) (* value 2)) *values*))
(defparameter *total* (reduce #'+ *values* :initial-value 0))

;;
;;    Memory Management
;;
;; The implementation manages objects; resource macros guarantee cleanup on control transfer.
(defparameter *first-character*
  (with-input-from-string (stream "sample")
    (read-char stream)))

;;
;;    Concurrency & Parallelism
;;
;; SBCL threads are an implementation extension; join-thread waits and returns results.
#+sb-thread
(let ((worker (sb-thread:make-thread (lambda () 42))))
  (assert (= (sb-thread:join-thread worker) 42)))

;;
;;    Performance Optimization
;;
;; Choose data structures and allocation patterns using measured compiler/runtime behavior.
(defparameter *allowed* (make-hash-table :test 'equal))
(setf (gethash "Ada" *allowed*) t)
(assert (gethash "Ada" *allowed*))

(format t "Hello, World!~%")
