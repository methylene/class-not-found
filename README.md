class-not-found
===============

Demonstrate a compile problem we had with cascalog.

Try this to cause a `java.lang.ClassNotFoundException` `cascalog.logic.def.ParallelAggregator`:

````
lein do clean, deps, uberjar
````

The clojure version is 1.5.1.

The lein version is: Leiningen 2.3.4 on Java 1.7.0_51 OpenJDK 64-Bit Server VM

The full stack trace from leiningen:

````
[class-not-found(master)]$ lein do clean, deps, uberjar
Compiling class-not-found.core
Compiling class-not-found.core
Exception in thread "main" java.lang.NoClassDefFoundError: cascalog/logic/def/ParallelAggregator
	at class_not_found.core$fn__3989.invoke(core.clj:5)
	at class_not_found.core__init.load(Unknown Source)
	at class_not_found.core__init.<clinit>(Unknown Source)
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:270)
	at clojure.lang.RT.loadClassForName(RT.java:2098)
	at clojure.lang.RT.load(RT.java:430)
	at clojure.lang.RT.load(RT.java:411)
	at clojure.core$load$fn__5018.invoke(core.clj:5530)
	at clojure.core$load.doInvoke(core.clj:5529)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invoke(core.clj:5336)
	at clojure.core$compile$fn__5023.invoke(core.clj:5541)
	at clojure.core$compile.invoke(core.clj:5540)
	at user$eval3980.invoke(form-init8710838865907020759.clj:1)
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
Caused by: java.lang.ClassNotFoundException: cascalog.logic.def.ParallelAggregator
	at java.net.URLClassLoader$1.run(URLClassLoader.java:366)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
	at java.security.AccessController.doPrivileged(Native Method)
	at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	... 29 more

````

