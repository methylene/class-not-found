#!/bin/sh
CLASSPATH=target
CLASSPATH=$HOME/Downloads/clojure-1.5.1.jar:$CLASSPATH
CLASSPATH=$HOME/.m2/repository/record-holder/record-holder/2.1.1-SNAPSHOT/record-holder-2.1.1-SNAPSHOT.jar:$CLASSPATH
SCRIPT="(import [record_holder.def ParallelAggregator])\n(println (ParallelAggregator.))"
echo $SCRIPT | java -cp $CLASSPATH clojure.main -
