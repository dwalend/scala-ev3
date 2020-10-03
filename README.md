Herein is my prototype to get Scala Native running on a LEGO EV3.

Start by building the docker image:

docker build --no-cache --tag ev3clang-buster -f docker/withClangAndScala.docker .

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/scala-ev3:/scala-ev3 -w /scala-ev3 ev3clang-buster

Test a c "Hello World"

cd c-hello/
mkdir target
arm-linux-gnueabi-gcc -o target/hello hello.c
qemu-arm-static -L /usr/arm-linux-gnueabi/ target/hello

Hello World!
