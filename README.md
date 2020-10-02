Compile C code on the ev3cc docker (and run it):

From https://www.ev3dev.org/docs/tutorials/using-docker-to-cross-compile

Download and install docker

docker pull ev3dev/debian-stretch-cross
docker tag ev3dev/debian-stretch-cross ev3cc
docker images
emacs example/hello.c

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3cc

And now on the docker prompt:

arm-linux-gnueabi-gcc -o hello hello.c
qemu-arm-static -L /usr/arm-linux-gnueabi/ ./hello

---

To compile directly from the mac command line:

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3cc arm-linux-gnueabi-gcc -o hello hello.c

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3cc qemu-arm-static -L /usr/arm-linux-gnueabi/ ./hello

---

To install clang (Thanks to David Lechner on https://gitter.im/ev3dev/chat#)

sudo apt update
sudo apt install clang

clang --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -I /usr/arm-linux-gnueabi/include -o hello hello.c
qemu-arm-static -L /usr/arm-linux-gnueabi/ ./hello

- or -

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3cc clang --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -I /usr/arm-linux-gnueabi/include -o hello hello.c

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3cc qemu-arm-static -L /usr/arm-linux-gnueabi/ ./hello

---

Docker image with clang

cd to the /Users/dwalend/projects/scala-ev3/ev3-C/docker directory

docker build --no-cache --tag ev3clang -f withClang.dockerfile .

Can now

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3clang clang --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -I /usr/arm-linux-gnueabi/include -o hello hello.c

docker run --rm -it -v /Users/dwalend/projects/scala-ev3/ev3-C/example/:/src -w /src ev3clang qemu-arm-static -L /usr/arm-linux-gnueabi/ ./hello

---


By putting that first docker command in a shell script and setting

nativeClang := file("dockerClang.sh")

in build.sbt

Next is getting the llvm-stage code over to docker

---

But this really isn't playing out well. Instead I've set up the full SBT toolchain on the docker image via withClangAndScala.docker.

Got scala native hello world running on the image - by folling the scala-native instructions.

I got shadaj's 32-bit scala native there by building it on the docker image. Need a better way to do that - preserve ~/.ivy2 somewhere else.

   11  pushd ../shadaj-scala-native/
   12  ls
   13  rm -rf target
   14  sbt publishLocal

Getting the 32-bit scala native plugged in to that,
then  pushing it along to use the right triple and try it in the emulator.

After that there'll be something to load onto the EV3.

---

Eventually - deploy native Scala code on the EV3 from a Jupyter Notebook