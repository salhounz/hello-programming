#lang racket

;; A transparent structure provides a constructor and field accessors.
(struct book (title available? tags) #:transparent)
(define books
  (list (book "Dune" #t '(fiction space))
        (book "Emma" #f '(fiction))
        (book "Sapiens" #t '(history))))

;; Strings, booleans, symbols, and lists are ordinary values.
(define shelf-name "Neighborhood shelf")
(define open? #t)

(define (label item)
  (string-append (book-title item)
                 " — "
                 (if (book-available? item) "on shelf" "on loan")))

#| Higher-order functions transform collections
   without mutating the input list. |#
(define available-titles
  (sort (map book-title (filter book-available? books)) string<?))

;; Pattern matching handles both empty and nonempty lists.
(define (first-title catalog)
  (match catalog
    ['() "No books"]
    [(cons item _) (book-title item)]))

;; struct-copy creates a new record.
(define original (first books))
(define borrowed (struct-copy book original [available? #f]))

(displayln shelf-name)
(when open?
  (for ([item (in-list books)])
    (displayln (label item))))
(printf "Choose: ~a\n" (string-join available-titles ", "))
(printf "First: ~a\n" (first-title books))
(printf "Empty: ~a\n" (first-title '()))
(printf "Original: ~a\n" (label original))
(printf "Updated: ~a\n" (label borrowed))

;; An immutable hash supports keyed access and a missing-key fallback.
(define catalog
  (for/hash ([item (in-list books)])
    (values (book-title item) item)))
(define found (hash-ref catalog "Dune" #f))
(if found
    (printf "Found: ~a\n" (label found))
    (displayln "Missing title"))

(define fiction
  (for/list ([item (in-list books)]
             #:when (member 'fiction (book-tags item)))
    (book-title item)))
(printf "Fiction: ~a\n" fiction)
