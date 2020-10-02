#!/bin/bash
declare -a ARGS
for var in "$@"; do
  if [ "$var" = 'x86_64-pc-linux-gnu' ]; then
    ARGS[${#ARGS[@]}]="arm-linux-gnueabi"
  else
    ARGS[${#ARGS[@]}]="$var"
  fi
done

echo "${ARGS[@]}"

#clang++ --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -I /usr/arm-linux-gnueabi/include "$@"
#clang++ -v --target=arm-linux-gnueabi -mabi=aapcs-linux -mfloat-abi=soft -march=armv5te -I /usr/arm-linux-gnueabi/include -I /usr/arm-linux-gnueabi/include/c++/6 "$@"

#-mabi=aapcs-linux -mfloat-abi=soft -march=armv5te

clang++ -v --target=arm-linux-gnueabi -I /usr/arm-linux-gnueabi/include -I /usr/arm-linux-gnueabi/include/c++/6 -I /usr/lib/gcc/arm-linux-gnueabi/6/include -D __CLANG_UNWIND_H "${ARGS[@]}"