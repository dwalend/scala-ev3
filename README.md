Herein is my prototype to get Scala Native running on a LEGO EV3.

Start by building the docker image - you'll need to boost the available docker host memory to more than 4 GB to build it::

docker build -m 4g --no-cache --tag ev3clang-buster -f docker/withClangAndScala.docker .

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/scala-ev3:/scala-ev3 -w /scala-ev3 ev3clang-buster

Test a c "Hello World"

cd c-hello/
mkdir target
arm-linux-gnueabi-gcc -o target/hello hello.c
qemu-arm-static -L /usr/arm-linux-gnueabi/ target/hello

Hello World!

Run a Hello world with scala-native (still x86)

cd hello/
sbt run
...
[info] Total (15958 ms)
Hello from Scala Native!
[success] Total time: 24 s, completed Oct 3, 2020 7:46:16 PM

Merged in @shadaj's 32-bit branch, and everything still works.

Next is to figure out the build settings. I'm currently getting a lot of missing include files that I don't yet understand:

```
[debug] running
[debug] /usr/bin/clang-7
[debug]         -std=gnu11
[debug]         -fvisibility=hidden
[debug]         -O2
[debug]         -I/usr/local/include
[debug]         -Qunused-arguments
[debug]         --target=arm-linux-gnueabi
[debug]         -mabi=aapcs-linux
[debug]         -mfloat-abi=soft
[debug]         -march=armv5te
[debug]         -I /usr/arm-linux-gnueabi/include
[debug]         -dI
[debug]         -c
[debug]         /scala-ev3/hello/target/scala-2.11/native/lib/libunwind/UnwindLevel1.c
[debug]         -o
[debug]         /scala-ev3/hello/target/scala-2.11/native/lib/libunwind/UnwindLevel1.c.o
[error] In file included from /scala-ev3/hello/target/scala-2.11/native/lib/dyndispatch.c:1:
[error] /usr/include/stdlib.h:25:10: fatal error: 'bits/libc-header-start.h' file not found
[error] #include <bits/libc-header-start.h>
[error]          ^~~~~~~~~~~~~~~~~~~~~~~~~~
```