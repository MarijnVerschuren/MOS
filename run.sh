# compile the boot sector
sh src/boot/compile.sh

# compile the kernel
sh src/kernel/compile.sh


# concatenate the binaries ("zero.bin" is added to make sure the disk can be read (only needed with a virtual disk))
cat src/boot/bin/boot.bin src/kernel/bin/kernel.bin int/zero.bin > bin/os.bin

# run the virtual machine
qemu-system-x86_64 -drive file=bin/os.bin,format=raw,index=0,if=floppy -m 128M