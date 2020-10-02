enablePlugins(ScalaNativePlugin)

scalaVersion := "2.11.12"

//nativeClang := file("clangArm.sh")

//nativeClangPP := file("clang++Arm.sh")

nativeCompileOptions ++= Seq(
//  "--target=arm-linux-gnueabi",
//  "-mabi=aapcs-linux",
//  "-mfloat-abi=soft",
//  "-march=armv5te"

//  "-fuse-ld=/usr/arm-linux-gnueabi/bin/ld",

//  "-I /usr/arm-linux-gnueabi/include",
//  "-I /usr/arm-linux-gnueabi/include/c++/6",
//  "-D __CLANG_UNWIND_H"
)

nativeLinkingOptions ++= Seq(
//  "--target=arm-linux-gnueabi",
//  "-mabi=aapcs-linux",
//  "-mfloat-abi=soft",
//  "-march=armv5te"

//  "-fuse-ld=/usr/arm-linux-gnueabi/bin/ld"
//  "-D __CLANG_UNWIND_H"
)

//nativeGC := "boehm"

//nativeLink := file("/usr/arm-linux-gnueabi/bin/ld")

//no luck nativeTarget := "arm-linux-gnueabi"
