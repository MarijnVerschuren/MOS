@echo off

REM compile the boot sector
call src\boot\compile.bat

REM compile the kernel
call src\kernel\compile.bat


REM concatenate the binaries ["zero.bin" is added to make sure the disk can be read [only needed with a virtual disk]]
copy /b src\boot\bin\boot.bin+src\kernel\bin\kernel.bin+int\zero.bin bin\os.bin

REM run the virtual machine
qemu-system-x86_64 -drive file=bin\os.bin,format=raw,index=0,if=floppy -m 128M