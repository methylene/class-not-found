(ns class-not-found.core (:gen-class :main true))
(require '[record-holder.def])
(import [record_holder.def ParallelAggregator])
(defn -main [& _] (println (ParallelAggregator.)))
