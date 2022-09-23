dir=$(dirname "$0")

# compile the kernel and kernel_entry in to object files
gcc -ffreestanding -m32 -g -O3 -c -o $dir/int/kernel.o $dir/src/kernel.c
nasm -f elf -o $dir/int/kernel_entry.o $dir/src/kernel_entry.asm

# link all object files
ld -T NUL -o $dir/int/kernel.tmp -Ttext 0x1000 $dir/int/kernel_entry.o $dir/int/kernel.o
objcopy -O binary -j .text $dir/int/kernel.tmp $dir/bin/kernel.bin