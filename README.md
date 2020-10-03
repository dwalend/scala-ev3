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



Next is to get it to build for ARM.