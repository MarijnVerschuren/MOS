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



root_folder = os.path.dirname(os.path.abspath(__file__))
build_folder = os.path.join(root_folder, "build")
boot_build_folder = multi_join(build_folder, "src", "boot")
kernel_build_folder = multi_join(build_folder, "src", "kernel")
in_files = [
	multi_join(boot_build_folder, 'bin', "boot.bin"),
	multi_join(kernel_build_folder, 'bin', "kernel.bin"),

	multi_join(build_folder, 'int', "zero.bin")
]
out_file = multi_join(build_folder, 'bin', 'os.bin')


if __name__ == "__main__":
	compile_flags = []
	virtual_machine_flags = ["-m 512M"]
	if "-help" in sys.argv: print(
			"[-c-to-asm]\tcompile c files into asm files",
			sep="\n", end="\n\n"
		); exit(0)  # dont compile after this
	if "-c-to-asm" in sys.argv: compile_flags.append("-c-to-asm")

	os.chdir(boot_build_folder)
	cerr(run(rf"python compile.py {' '.join(compile_flags)}"), "boot build fail")		# creates boot.bin
	os.chdir(kernel_build_folder)
	cerr(run(rf"python compile.py {' '.join(compile_flags)}"), "kernel build fail")	# creates kernel.bin

	os.chdir(build_folder)
	# combine all files into one raw disk file
	if windows:	cerr(run(rf"copy /b {'+'.join(in_files)} {out_file}"), "file concat error")
	else:		cerr(run(rf"cat {' '.join(in_files)} > {out_file}"), "file concat error")

	run(rf"qemu-system-x86_64 -drive file={out_file},format=raw,index=0,if=floppy {' '.join(virtual_machine_flags)}")