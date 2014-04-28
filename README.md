class-not-found
===============

This project originally showed a compile problem we had with cascalog. But now it looks like a leiningen / classloading issue. There is a combination of `defrecord` (in the "library" project), `import` and `require` (in `user.clj`) that leiningen doesn't like.

The problem can be worked around by adding an :aot in the library project. However, some say that this would be a bad style. Also it would be tiresome to have to go and sprinkle :aot everywhere, just because of some leiningen hickup.

Try this to cause a `java.lang.ClassNotFoundException` `record-holder.def.ParallelAggregator` (just a random class name borrowed from cascalog):


````
cd lib/record-holder
lein install
cd ../..
LEIN_SNAPSHOTS_IN_RELEASE=true lein do clean, deps, uberjar
````

(UPDATE: `lein repl` in the last step causes a similar error)


The clojure version is 1.5.1.

The lein version is: Leiningen 2.3.4 on Java 1.7.0_51 OpenJDK 64-Bit Server VM

The full stack trace from leiningen:

````
[class-not-found(master)]$ lein repl
Compiling class-not-found.core
Exception in thread "main" java.lang.ClassNotFoundException: record-holder.def.ParallelAggregator
	at java.net.URLClassLoader$1.run(URLClassLoader.java:366)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
	at java.security.AccessController.doPrivileged(Native Method)
	at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
	at clojure.lang.DynamicClassLoader.findClass(DynamicClassLoader.java:61)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:270)
	at clojure.lang.RT.classForName(RT.java:2070)
	at clojure.lang.Compiler$ImportExpr.eval(Compiler.java:698)
	at clojure.lang.Compiler.compile1(Compiler.java:7153)
	at clojure.lang.Compiler.compile1(Compiler.java:7143)
	at clojure.lang.Compiler.compile(Compiler.java:7219)
	at clojure.lang.RT.compile(RT.java:398)
	at clojure.lang.RT.load(RT.java:438)
	at clojure.lang.RT.load(RT.java:411)
	at clojure.core$load$fn__5018.invoke(core.clj:5530)
	at clojure.core$load.doInvoke(core.clj:5529)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invoke(core.clj:5336)
	at clojure.core$compile$fn__5023.invoke(core.clj:5541)
	at clojure.core$compile.invoke(core.clj:5540)
	at user$eval55.invoke(form-init326946708422476762.clj:1)
	at clojure.lang.Compiler.eval(Compiler.java:6619)
	at clojure.lang.Compiler.eval(Compiler.java:6609)
	at clojure.lang.Compiler.load(Compiler.java:7064)
	at clojure.lang.Compiler.loadFile(Compiler.java:7020)
	at clojure.main$load_script.invoke(main.clj:294)
	at clojure.main$init_opt.invoke(main.clj:299)
	at clojure.main$initialize.invoke(main.clj:327)
	at clojure.main$null_opt.invoke(main.clj:362)
	at clojure.main$main.doInvoke(main.clj:440)
	at clojure.lang.RestFn.invoke(RestFn.java:421)
	at clojure.lang.Var.invoke(Var.java:419)
	at clojure.lang.AFn.applyToHelper(AFn.java:163)
	at clojure.lang.Var.applyTo(Var.java:532)
	at clojure.main.main(main.java:37)
Compilation failed: Subprocess failed
````
