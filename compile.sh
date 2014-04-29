#!/bin/sh
CLASSPATH=src
CLASSPATH=test:$CLASSPATH
CLASSPATH=$HOME/Downloads/clojure-1.5.1.jar:$CLASSPATH
CLASSPATH=$HOME/.m2/repository/record-holder/record-holder/2.1.1-SNAPSHOT/record-holder-2.1.1-SNAPSHOT.jar:$CLASSPATH
cat compile.clj | java -cp $CLASSPATH clojure.main -
