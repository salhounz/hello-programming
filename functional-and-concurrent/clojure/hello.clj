(ns hello)

;;
;;    Type Systems & Variables
;;
;; let creates lexical bindings; def names namespace-level values and types belong to values.
(def score 10)
(def language "Clojure")
(def updated-score (+ score 5))

;;
;;    Control Flow Operations
;;
;; if returns a value; doseq iterates for effects while map transforms sequences.
(def result (if (>= updated-score 10) :pass :retry))
(def indexed-values (for [value (range 3)] (+ value 1)))

;;
;;    Execution Blocks
;;
;; Functions and lexical let blocks group reusable expressions.
(defn add [left right] (+ left right))
(def sum (let [local 2] (add local 3)))

;;
;;    Code Health & Documentation
;;
;; Semicolons introduce comments; docstrings document functions and comment forms skip evaluation.
;; A line comment.
;; Adjacent lines document longer notes.
(defn square "Return the square of value." [value] (* value value))
(comment (square 3))

;;
;;    Built-In Collections
;;
;; Vectors are indexed, lists are sequential, maps associate keys, and sets store unique values.
(def values [1 2 3])
(def inventory {:apples 3})
(def unique #{1 2})

;;
;;    Data Mutability
;;
;; Persistent updates return a new collection; atoms provide controlled mutable references.
(def extended (conj values 4))
(def counter-state (atom 0))
(swap! counter-state inc)

;;
;;    Access & Encapsulation
;;
;; Namespaces organize APIs; defn- marks a namespace-private function.
(defn- double-value [value] (* value 2))
(defn transform-values [items] (mapv double-value items))

;;
;;    Design Paradigms & Patterns
;;
;; Pure functions and higher-order sequence operations separate computation from effects.
(def doubled (transform-values values))
(def total (reduce + 0 values))

;;
;;    Memory Management
;;
;; JVM GC handles objects; with-open closes resources that implement the close contract.
(def first-character
  (with-open [reader (java.io.StringReader. "sample")]
    (.read reader)))

;;
;;    Concurrency & Parallelism
;;
;; future starts work through a thread pool; dereferencing waits for the result.
(def pending (future (+ 20 22)))
(def answer @pending)

;;
;;    Performance Optimization
;;
;; Use sets for membership and avoid realizing large lazy sequences unnecessarily.
(def allowed #{"Ada" "Grace"})
(def is-allowed (contains? allowed "Ada"))

(println "Hello, World!")
(shutdown-agents)
