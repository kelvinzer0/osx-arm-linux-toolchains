Building cross-compiler toolchains is a time-consuming process. This site provides pre-built cross-compiler toolchains for Apple Mac OS X (i.e. Darwin), targetting the Linux operating system on common architectures, currently `arm` and `aarch64`. In other words, compile code for ARM/Linux on your Mac.

Based on [gcc](gcc.gnu.org) and [binutils](https://www.gnu.org/software/binutils/), toolchains are provided currently in one variant, namely [glibc](https://www.gnu.org/software/libc/), with support for [uClibc-ng](https://uclibc-ng.org/) and [musl](http://www.musl-libc.org/) possible in the future if there is interest. The toolchains are built using the [crosstools-ng](https://crosstool-ng.github.io/) build system.

## Downloads

| Toolchain | GCC | GDB | Linux headers | glibc | binutils |
|--|--|--|--|--|--|
| [aarch64-unknown-linux-gnu](https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/aarch64-unknown-linux-gnu.tar.xz) | 8.3.0 | 8.2.1 | 4.20.8 | 2.29 | 2.32 |
| [arm-unknown-linux-gnueabi](https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/arm-unknown-linux-gnueabi.tar.xz) | 8.3.0 | 8.2.1 | 4.20.8 | 2.29 | 2.32 |
| [armv8-rpi3-linux-gnueabihf](https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/armv8-rpi3-linux-gnueabihf.tar.xz) | 8.3.0 | 8.2.1 | 4.20.8 | 2.29 | 2.32 |
| [arm-unknown-linux-gnueabihf](https://github.com/thinkski/osx-arm-linux-toolchains/releases/download/8.3.0/arm-unknown-linux-gnueabihf.tar.xz) | 8.3.0 | 8.2.1 | 4.20.8 | 2.28 | 2.32 |

## Code Signing

On Catalina and later, executables need to be code-signed. This can be done via:

    find /path/to/installation/directory -executable | xargs -n1 sudo codesign --force --deep --sign -

## Support or Contact

If you find a problem or would like to see support for a new architecture or component combination, please [file an issue](https://github.com/thinkski/osx-arm-linux-toolchains/issues).

## Installer
```
sudo chmod +x installer.sh
./installer.sh
```

=== Setup Cross Compiler Toolchains ===

1. aarch64-unknown-linux-gnu (ARM 64-bit umum)
export CROSS_COMPILE=aarch64-unknown-linux-gnu-
export PATH=/opt/cross/aarch64-unknown-linux-gnu/bin:$PATH

2. arm-unknown-linux-gnueabi (ARM 32-bit, EABI, tanpa hard float)
export CROSS_COMPILE=arm-unknown-linux-gnueabi-
export PATH=/opt/cross/arm-unknown-linux-gnueabi/bin:$PATH

3. armv8-rpi3-linux-gnueabihf (ARMv8 untuk Raspberry Pi 3, 64-bit dengan hard float)
export CROSS_COMPILE=armv8-rpi3-linux-gnueabihf-
export PATH=/opt/cross/armv8-rpi3-linux-gnueabihf/bin:$PATH

4. arm-unknown-linux-gnueabihf (ARM 32-bit, EABI dengan hard float)
export CROSS_COMPILE=arm-unknown-linux-gnueabihf-
export PATH=/opt/cross/arm-unknown-linux-gnueabihf/bin:$PATH

--------------------------------------------------------

Catatan Penting:
- Sesuaikan toolchain dengan target device dan kebutuhan build kamu.
- Setelah setting ini, kamu bisa menjalankan build kernel/module dengan perintah make menggunakan cross-compiler.
- Untuk permanen, simpan export ini di ~/.bash_profile atau ~/.zshrc.
- Pastikan folder /opt/cross/... sesuai dengan lokasi instalasi toolchain kamu.
