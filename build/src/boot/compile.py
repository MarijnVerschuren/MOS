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



boot_build_folder = os.path.dirname(os.path.abspath(__file__))
in_file = multi_join(boot_build_folder, "src", "boot.asm")
out_file = multi_join(boot_build_folder, 'bin', 'boot.bin')



if __name__ == '__main__':
	cerr(run(rf"nasm -f bin -o {out_file} {in_file}"), f"failed to compile {in_file}")