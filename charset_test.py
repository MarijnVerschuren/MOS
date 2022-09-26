import json




if __name__ == "__main__":
	with open("charset.json", "r") as file:
		data = json.load(file)["glyphs"]

	for key, dat in data.items():
		print(key, "\toffset:", dat["offset"])
		for row in dat["pixels"]:
			for pix in row:
				print(pix, end=" ")
			print()
		print("\n")
	
	print(len(data.items()))