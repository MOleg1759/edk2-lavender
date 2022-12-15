#!/bin/sh

KERNEL_DIR=$(pwd)
sudo apt-get update ; sudo apt-get upgrade
sudo apt-get install -y build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg bspatch p7zip-full zip python3-pip wget unzip
sudo pip install uefi_firmware
git clone --depth 1 https://github.com/tianocore/edk2.git --recursive
git clone --depth 1 https://github.com/tianocore/edk2-platforms.git
wget https://drive.google.com/file/d/13PrYhPfcu6kSkHcFIwIjrAcJ6lN5JI0e/view?usp=drivesdk
wget https://drive.google.com/file/d/13Pyqw-tPmadGwYDXvRx1Gzre0hfFCeul/view?usp=drivesdk
unzip edk2-lavender.0.0.3.zip
cd edk2-lavender/xbl
bash xbl-extract.sh
bash patch.sh
cd $KERNEL_DIR
make -C edk2-lavender/../edk2/BaseTools/Source/C
cd edk2-lavender
bash builder.sh
alias tgsender="$KERNAL_DIR/tgsender.sh"
tgsender uefi.img
