;; This script uses GNU Guile's format procedure.
(use-modules (ice-9 format))

;; Association lists pair symbolic keys with values.
(define books
  (list
    '((title . "Dune") (available . #t) (tags fiction space))
    '((title . "Emma") (available . #f) (tags fiction))
    '((title . "Sapiens") (available . #t) (tags history))))

(define shelf-name "Neighborhood shelf")
(define open? #t)

;; A procedure can extract and describe one record.
(define (label book)
  (string-append
    (assq-ref book 'title)
    " — "
    (if (assq-ref book 'available) "on shelf" "on loan")))

;; A named let expresses a tail-recursive traversal.
(define (available-titles catalog)
  (let loop ((rest catalog) (titles '()))
    (cond
      ((null? rest) (reverse titles))
      ((assq-ref (car rest) 'available)
       (loop (cdr rest) (cons (assq-ref (car rest) 'title) titles)))
      (else (loop (cdr rest) titles)))))

(define (first-title catalog)
  (if (null? catalog)
      "No books"
      (assq-ref (car catalog) 'title)))

;; Quoted literals should not be mutated; construct fresh data instead.
(define original (car books))
(define borrowed
  (map (lambda (entry)
         (if (eq? (car entry) 'available)
             (cons 'available #f)
             entry))
       original))

(display shelf-name)
(newline)
(if open?
    (for-each (lambda (book) (display (label book)) (newline)) books))
(format #t "Choose: ~a~%" (available-titles books))
(format #t "First: ~a~%" (first-title books))
(format #t "Empty: ~a~%" (first-title '()))
(format #t "Original: ~a~%" (label original))
(format #t "Updated: ~a~%" (label borrowed))

;; Vectors provide indexed access; lists are traversed with car/cdr.
(define hours (vector "09:00" "17:00"))
(format #t "Opens: ~a~%" (vector-ref hours 0))
