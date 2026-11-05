(ns examples
  (:require [clojure.string :as str]))

;; Values have types; these bindings name immutable data.
(def library "Neighborhood shelf")
(def open? true)
(def books
  [{:title "Dune" :available? true :tags #{:fiction :space}}
   {:title "Emma" :available? false :tags #{:fiction}}
   {:title "Sapiens" :available? true :tags #{:history}}])

;; Keywords act as functions when reading maps.
(defn label
  "Describe one book without changing it."
  [{:keys [title available?]}]
  (str title " — " (if available? "on shelf" "on loan")))

;; ->> threads the sequence into the last argument position.
(def available-titles
  (->> books
       (filter :available?)
       (map :title)
       (sort)
       (vec)))

;; assoc produces a new map; the original stays available.
(def borrowed (assoc (first books) :available? false))
(println "Original:" (label (first books)))
(println "Updated:" (label borrowed))

;; A set provides membership, including in a predicate.
(defn fiction? [book]
  (contains? (:tags book) :fiction))
(def fiction (filterv fiction? books))

;; get accepts a fallback for a missing key.
(def settings {:limit 2})
(def limit (get settings :limit 1))
(def selection (take limit available-titles))

(println library)
(when open?
  (doseq [book books]
    (println (label book))))
(println "Choose:" (str/join ", " selection))
(println "Fiction count:" (count fiction))

;; Atoms hold explicit state; swap! applies an atomic update.
(def visits (atom 0))
(swap! visits inc)
(println "Visits:" @visits)

;; Destructuring also works for indexed collections.
(let [[first-title & remaining] available-titles]
  (println "First:" first-title)
  (println "Remaining:" remaining))
