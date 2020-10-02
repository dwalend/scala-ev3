#!/bin/bash
declare -a ARGS
for var in "$@"; do
  if [ "$var" = 'x86_64-pc-linux-gnu' ]; then
    echo "Removed $var"
  elif [ "$var" = '-triple' ]; then
    echo "Removed $var"
  else
    ARGS[${#ARGS[@]}]="$var"
  fi
done

echo "${ARGS[@]}"

#clang --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -fuse-ld=/usr/arm-linux-gnueabi/bin/ld -I /usr/arm-linux-gnueabi/include -I /usr/arm-linux-gnueabi/include/c++/6 "$@"

#/src/scala-native-example/clangArm.sh -c /src/scala-native-example/target/scala-2.11/native/3.ll -o /src/scala-native-example/target/scala-2.11/native/3.ll.o -O0 -I/usr/local/include -Qunused-arguments

#"/usr/lib/llvm-3.8/bin/clang" -cc1 -triple x86_64-pc-linux-gnu -emit-obj -mrelax-all -disable-free -disable-llvm-verifier -main-file-name 1.ll -mrelocation-model static -mthread-model posix -mdisable-fp-elim -fmath-errno -masm-verbose -mconstructor-aliases -munwind-tables -fuse-init-array -target-cpu x86-64 -v -dwarf-column-info -debugger-tuning=gdb -coverage-file /src/scala-native-example/target/scala-2.11/native/1.ll.o -resource-dir /usr/lib/llvm-3.8/bin/../lib/clang/3.8.1 -O0 -fdebug-compilation-dir /src/scala-native-example/target/scala-2.11/native -ferror-limit 19 -fmessage-length 0 -fobjc-runtime=gcc -fdiagnostics-show-option -o /src/scala-native-example/target/scala-2.11/native/1.ll.o -x ir /src/scala-native-example/target/scala-2.11/native/1.ll

#-mabi=aapcs-linux -mfloat-abi=soft -march=armv5te
clang -v --target=arm-linux-gnueabi -I /usr/arm-linux-gnueabi/include -I /usr/lib/gcc/arm-linux-gnueabi/6/include -I /usr/arm-linux-gnueabi/include/c++/6 -D __CLANG_UNWIND_H "${ARGS[@]}"