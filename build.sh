VERSION="1.5"
make clean && make mrproper
export ARCH=arm64
export CROSS_COMPILE=~/kernel/4.9/bin/aarch64-linux-android-
mkdir output
make -C $(pwd) O=output Qwerty_ysl_defconfig
make -j3 -C $(pwd) O=output
git clone  https://github.com/mahajant99/AnyKernel3.git -b ysl-aosp zip
cp -r output/arch/arm64/boot/Image.gz-dtb zip/
cd zip
mv Image.gz-dtb zImage 
zip -r Qwerty_Ubuntu_v1.5.zip *
