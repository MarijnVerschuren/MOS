import os, sys



run = lambda x: os.system(x)
def multi_join(*args) -> str:
	out = args[0]
	for arg in args[1:]: out = os.path.join(out, arg)
	return out
windows = os.name in ["nt", "dos"]
clear_console = lambda: run("cls" if windows else "clear")
def cerr(code: int, prompt: str) -> None:  # check error
	if code: print(prompt); exit(1)



kernel_build_folder = os.path.dirname(os.path.abspath(__file__))
build_files = [
	[
		multi_join(kernel_build_folder, 'src', "kernel.asm"),
		multi_join(kernel_build_folder, 'int', "kernel.asm.o")
	],
	[
		multi_join(kernel_build_folder, 'src', "kernel.c"),
		multi_join(kernel_build_folder, 'int', "kernel.c.o")
	],
	[
		multi_join(kernel_build_folder, 'src', "io.c"),
		multi_join(kernel_build_folder, 'int', "io.c.o")
	],
	[
		multi_join(kernel_build_folder, 'src', "math.asm"),
		multi_join(kernel_build_folder, 'int', "math.asm.o")
	],
]
tmp_file = multi_join(kernel_build_folder, "int", "kernel.tmp")
out_file = multi_join(kernel_build_folder, 'bin', 'kernel.bin')



if __name__ == '__main__':
	c_to_asm = False
	optimization_flag = "-O3"
	if "-help" in sys.argv: print(
			"[-c-to-asm]\tcompile c files into asm files",
			sep="\n", end="\n\n"
		); exit(0)  # dont compile after this
	if "-c-to-asm" in sys.argv: c_to_asm = True

	int_files = []
	for src_file, int_file in build_files:
		if src_file.endswith(".asm"):
			cerr(run(rf"nasm -f elf -o {int_file} {src_file}"), f"failed to compile {src_file}")
		elif src_file.endswith(".c"):
			cerr(run(rf"gcc -ffreestanding -m32 -g {optimization_flag} -c -o {int_file} {src_file}"), f"failed to compile {src_file}")
			if c_to_asm: run(rf"gcc -ffreestanding -m32 {optimization_flag} -S -o {multi_join(kernel_build_folder, 'int', f'{src_file}.asm')} {src_file}")
		else: cerr(1, f"no compile rules for {src_file}")
		int_files.append(int_file)

	run(rf"ld -T NUL -o {tmp_file} -Ttext 0x1000 {' '.join(int_files)}")
	run(rf"objcopy -O binary -j .text {tmp_file} {out_file}")


# changing the optimization flag changes the bug where HEX_DIGITS can only be read some times
# CODE PROBABLY FALLS OUTSIDE LOADED DISK SPACE <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

# https://gist.github.com/gcr/1075131
# http://git.musl-libc.org/cgit/musl/tree/src/stdio/vfprintf.c