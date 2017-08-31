(ns class-not-found.core
  (:gen-class)
  (:require record-holder.def))

(defn -main [& _] (println (record-holder.def/->ParallelAggregator)))
