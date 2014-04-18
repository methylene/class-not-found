(ns class-not-found.core
  (:require [cascalog.api :refer [defparallelagg]]))

(defparallelagg parallel-mult
  :init-var #'identity
  :combine-var #'*)



