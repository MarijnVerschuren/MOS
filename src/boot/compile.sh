dir=$(dirname "$0")

nasm -f bin -o $dir/bin/boot.bin $dir/src/boot.asm