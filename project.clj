(defproject class-not-found "0.0.0"
  :dependencies [[org.clojure/clojure "1.5.1"]
                 [cascalog "2.1.1-SNAPSHOT"]]
  :main class-not-found.core
  :aot [class-not-found.core]
  :profiles {:provided {:dependencies [[org.apache.hadoop/hadoop-core "1.2.1"]]}})
