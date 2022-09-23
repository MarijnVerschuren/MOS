REM compile the kernel and kernel_entry in to object files
gcc -ffreestanding -m32 -g -O3 -c -o %~dp0int\kernel.o %~dp0src\kernel.c
nasm -f elf -o %~dp0int\kernel_entry.o %~dp0src\kernel_entry.asm

REM link all object files
ld -T NUL -o %~dp0int\kernel.tmp -Ttext 0x1000 %~dp0int\kernel_entry.o %~dp0int\kernel.o
objcopy -O binary -j .text %~dp0int\kernel.tmp %~dp0bin\kernel.bin