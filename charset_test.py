import json




if __name__ == "__main__":
	with open("charset.json", "r") as file:
		data = json.load(file)["glyphs"]


	# A: 00000000 00...00 
	# char_num : char_width data (data can only be 8 wide)

	"""
	for key, dat in data.items():
		print(key, int.from_bytes(key.encode(), "little"), "\toffset:", dat["offset"])
		l = 0
		for row in dat["pixels"]:
			if len(row) > l: l = len(row)
			for pix in row:
				if pix: print("\033[7m \033[0m", end=" ")
				else: print(" ", end=" ")
			print()
		print("\n")
		print(l)
	"""

	intermediate = {}
	for key, dat in data.items():
		intermediate.update({key.encode(): [len(dat["pixels"][0]), dat["pixels"]]})

	def format(data: list) -> int:
		width = data[0]
		char_data = data[1]
		if char_data == [[0,0,0]]: return 3
		char_compressed_data = 0
		for y in range(7)[::-1]:
			for x in range(width)[::-1]:
				char_compressed_data <<= 1
				char_compressed_data |= char_data[y][x]
		char_compressed_data <<= 8
		char_compressed_data |= width & 0xff
		return char_compressed_data


	charset = {}
	for i in range(128):
		j = bytes([i])
		charset.update({j.decode("ascii"): format(intermediate[j]) if j in intermediate else 0x00})

	print(charset)


	# print output
	import pprint
	pp = pprint.PrettyPrinter(indent=4)
	pp.pprint(charset)
	# pp.pprint([hex(item) for _, item in charset.items()])  # raw data
	
	"""
	dat = "{0:b}".format(charset['+'])
	print("0" * (64 - len(dat)) + dat)
	# 000000000000000000000000000000000000000000000 010 111 010 000 000 0011
	"""

	# testing
	"""
	dat = charset['~']
	print(hex(dat))
	dat_width = dat & 0xff
	dat >>= 8
	for y in range(7):
		for x in range(dat_width):
			if (dat >> x) & 1: print("\033[7m  \033[0m", end="")
			else: print(" ", end=" ")
		dat >>= dat_width
		print()
	"""