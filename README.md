class-not-found
===============

This project originally showed a compile problem we had with cascalog. But now it looks like a ~~leiningen / classloading~~ Clojure issue. ~~There is a combination of `defrecord` (in the "library" project), `import` and `require` (in `user.clj`) that leiningen doesn't like.~~

The problem can be worked around by adding an :aot in the library project. However, some say that this would be a bad style. Also it would be tiresome to have to go and sprinkle :aot everywhere.

Try this to cause a `java.lang.ClassNotFoundException` `record-holder.def.ParallelAggregator` (just a random class name borrowed from cascalog):


````
cd lib/record-holder
lein install
cd ../..
rm -rf target && lein do clean, deps, compile && lein repl
````

You can produce a similar without using leiningen, like this: `./install.sh && ./compile.sh && ./run.sh`. Notice how that works when you enable `aot` in [lib/record-holder/project.clj](lib/record-holder/project.clj).

The clojure version is 1.6.0

The lein version is: Leiningen 2.3.4 on Java 1.7.0_51 OpenJDK 64-Bit Server VM

The error looks like this:

````
[class-not-found(master)]$ ./install.sh && ./compile.sh && ./run.sh
Created /home/methylene/workspace/class-not-found/lib/record-holder/target/record-holder-2.1.1-SNAPSHOT.jar
Wrote /home/methylene/workspace/class-not-found/lib/record-holder/pom.xml
Exception in thread "main" java.lang.ExceptionInInitializerError
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:270)
	at clojure.lang.RT.loadClassForName(RT.java:2098)
	at clojure.lang.RT.load(RT.java:430)
	at clojure.lang.RT.load(RT.java:411)
	at clojure.core$load$fn__5018.invoke(core.clj:5530)
	at clojure.core$load.doInvoke(core.clj:5529)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.lang.Var.invoke(Var.java:415)
	at class_not_found.core.<clinit>(Unknown Source)
Caused by: java.lang.ClassNotFoundException: record_holder.def.ParallelAggregator
	at java.net.URLClassLoader$1.run(URLClassLoader.java:366)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
	at java.security.AccessController.doPrivileged(Native Method)
	at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:190)
	at class_not_found.core$loading__4910__auto__.invoke(core.clj:1)
	at class_not_found.core__init.load(Unknown Source)
	at class_not_found.core__init.<clinit>(Unknown Source)
	... 10 more
````

Or it may use like this, when using lein:

````
[class-not-found(master)]$ rm -rf target && lein do clean, deps, compile && lein repl
Compiling class-not-found.core
Exception in thread "main" java.lang.ExceptionInInitializerError, compiling:(/tmp/form-init3709974472491957530.clj:1:90)
	at clojure.lang.Compiler.load(Compiler.java:7142)
	at clojure.lang.Compiler.loadFile(Compiler.java:7086)
	at clojure.main$load_script.invoke(main.clj:274)
	at clojure.main$init_opt.invoke(main.clj:279)
	at clojure.main$initialize.invoke(main.clj:307)
	at clojure.main$null_opt.invoke(main.clj:342)
	at clojure.main$main.doInvoke(main.clj:420)
	at clojure.lang.RestFn.invoke(RestFn.java:421)
	at clojure.lang.Var.invoke(Var.java:383)
	at clojure.lang.AFn.applyToHelper(AFn.java:156)
	at clojure.lang.Var.applyTo(Var.java:700)
	at clojure.main.main(main.java:37)
Caused by: java.lang.ExceptionInInitializerError
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:270)
	at clojure.lang.RT.loadClassForName(RT.java:2093)
	at clojure.lang.RT.load(RT.java:430)
	at clojure.lang.RT.load(RT.java:411)
	at clojure.core$load$fn__5066.invoke(core.clj:5641)
	at clojure.core$load.doInvoke(core.clj:5640)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at clojure.core$load_one.invoke(core.clj:5446)
	at clojure.core$load_lib$fn__5015.invoke(core.clj:5486)
	at clojure.core$load_lib.doInvoke(core.clj:5485)
	at clojure.lang.RestFn.applyTo(RestFn.java:142)
	at clojure.core$apply.invoke(core.clj:626)
	at clojure.core$load_libs.doInvoke(core.clj:5524)
	at clojure.lang.RestFn.applyTo(RestFn.java:137)
	at clojure.core$apply.invoke(core.clj:626)
	at clojure.core$require.doInvoke(core.clj:5607)
	at clojure.lang.RestFn.invoke(RestFn.java:408)
	at user$eval42.invoke(form-init3709974472491957530.clj:1)
	at clojure.lang.Compiler.eval(Compiler.java:6703)
	at clojure.lang.Compiler.eval(Compiler.java:6692)
	at clojure.lang.Compiler.eval(Compiler.java:6692)
	at clojure.lang.Compiler.load(Compiler.java:7130)
	... 11 more
Caused by: java.lang.ClassNotFoundException: record_holder.def.ParallelAggregator
	at java.net.URLClassLoader$1.run(URLClassLoader.java:366)
	at java.net.URLClassLoader$1.run(URLClassLoader.java:355)
	at java.security.AccessController.doPrivileged(Native Method)
	at java.net.URLClassLoader.findClass(URLClassLoader.java:354)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:425)
	at sun.misc.Launcher$AppClassLoader.loadClass(Launcher.java:308)
	at java.lang.ClassLoader.loadClass(ClassLoader.java:358)
	at java.lang.Class.forName0(Native Method)
	at java.lang.Class.forName(Class.java:190)
	at class_not_found.core$loading__4958__auto__.invoke(core.clj:1)
	at class_not_found.core__init.load(Unknown Source)
	at class_not_found.core__init.<clinit>(Unknown Source)
	... 34 more
Exception in thread "Thread-4" clojure.lang.ExceptionInfo: Subprocess failed {:exit-code 1}
	at clojure.core$ex_info.invoke(core.clj:4327)
	at leiningen.core.eval$fn__3532.invoke(eval.clj:226)
	at clojure.lang.MultiFn.invoke(MultiFn.java:231)
	at leiningen.core.eval$eval_in_project.invoke(eval.clj:326)
	at clojure.lang.AFn.applyToHelper(AFn.java:167)
	at clojure.lang.AFn.applyTo(AFn.java:151)
	at clojure.core$apply.invoke(core.clj:619)
	at leiningen.repl$server$fn__7443.invoke(repl.clj:201)
	at clojure.lang.AFn.applyToHelper(AFn.java:159)
	at clojure.lang.AFn.applyTo(AFn.java:151)
	at clojure.core$apply.invoke(core.clj:617)
	at clojure.core$with_bindings_STAR_.doInvoke(core.clj:1788)
	at clojure.lang.RestFn.invoke(RestFn.java:425)
	at clojure.lang.AFn.applyToHelper(AFn.java:163)
	at clojure.lang.RestFn.applyTo(RestFn.java:132)
	at clojure.core$apply.invoke(core.clj:621)
	at clojure.core$bound_fn_STAR_$fn__4102.doInvoke(core.clj:1810)
	at clojure.lang.RestFn.invoke(RestFn.java:397)
	at clojure.lang.AFn.run(AFn.java:24)
	at java.lang.Thread.run(Thread.java:744)
````
