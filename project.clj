(defproject class-not-found "0.0"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [cascalog "2.1.0"]
                 [org.apache.hadoop/hadoop-core "1.1.2"]]
  :main class-not-found.core
  :aot [class-not-found.core])
