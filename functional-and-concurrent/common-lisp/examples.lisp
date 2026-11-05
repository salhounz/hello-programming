;; A structure describes the slots of a book value.
(defstruct book
  (title "" :type string)
  (available-p t)
  (tags nil))

(defparameter *books*
  (list (make-book :title "Dune" :tags '(:fiction :space))
        (make-book :title "Emma" :available-p nil
                   :tags '(:fiction))
        (make-book :title "Sapiens" :tags '(:history))))

;; DEFUN supports a documentation string.
(defun book-label (item)
  "Return a printable description of ITEM."
  (format nil "~A — ~A"
          (book-title item)
          (if (book-available-p item) "on shelf" "on loan")))

#| Lists hold ordered data.
   REMOVE-IF-NOT returns a filtered list. |#
(defparameter *available*
  (remove-if-not #'book-available-p *books*))

;; MAPCAR applies a function to each list element.
(defparameter *titles*
  (mapcar #'book-title *available*))

;; COPY-BOOK copies the structure; referenced nested objects are shared.
(let ((borrowed (copy-book (first *books*))))
  (setf (book-available-p borrowed) nil)
  (format t "Original: ~A~%" (book-label (first *books*)))
  (format t "Updated: ~A~%" (book-label borrowed)))

;; String keys need EQUAL rather than the default identity test.
(defparameter *catalog* (make-hash-table :test 'equal))
(dolist (item *books*)
  (setf (gethash (book-title item) *catalog*) item))

;; GETHASH returns both a value and a presence flag.
(multiple-value-bind (item found-p) (gethash "Dune" *catalog*)
  (when found-p
    (format t "Found: ~A~%" (book-label item))))

(format t "Available: ~{~A~^, ~}~%" *titles*)
(loop for item in *books*
      when (member :fiction (book-tags item))
        do (format t "Fiction: ~A~%" (book-title item)))

;; A closure retains its own lexical binding.
(let* ((visits 0)
       (visit (lambda () (incf visits))))
  (format t "Visit: ~D~%" (funcall visit))
  (format t "Visit: ~D~%" (funcall visit)))
