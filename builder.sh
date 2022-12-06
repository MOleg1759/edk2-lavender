sudo apt install -y build-essential uuid-dev iasl git nasm python3-distutils gcc-aarch64-linux-gnu abootimg bspatch p7zip-full zip python-pip
sudo pip install uefi_firmware
git clone https://github.com/tianocore/edk2.git --recursive
git clone https://github.com/tianocore/edk2-platforms.git
wget https://github.com/serdeliuk/edk2-lavender/releases/download/2/edk2-lavender.0.0.3.zip
unzip edk2-lavender.0.0.3.zip
