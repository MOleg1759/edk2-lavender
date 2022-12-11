#!/bin/sh

KERNEL_DIR=$(pwd)

sudo apt install -y build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg bspatch p7zip-full zip python-pip
sudo pip install uefi_firmware
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
wget https://github.com/MOleg1759/edk2_lavender_0.0.3/blob/main/edk2-lavender.0.0.3.zip
wget https://github.com/MOleg1759/edk2_lavender_0.0.3/blob/main/tgsender.sh
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
