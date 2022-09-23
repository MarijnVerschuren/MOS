#define VISUAL_MEM (char*)0xb8000


inline void newline(char** pos) { *pos += 160 - (((*pos) - VISUAL_MEM) % 160); /* rounding the memory address up to 160 (new line) */ }

inline void putchar(char** pos, const char chr, const char col) {
	(*pos)[0] = chr;
	(*pos)[1] = col;
	*pos += 2; /* increment the memory offset */
}

void print(char** pos, const char* restrict str, const char col) {
	while (*str) {
		if (*str == '\n') {
			newline(pos);
		} else {
			putchar(pos, *str, col);
		}
		str += 1; /* get the next char */
	}
}


void kernel() {
	char*	pos =			VISUAL_MEM;
	/*
	char	col =			0x0f;
	char	string[] =		"printed text lol...\0";

	print(&pos, string, col); */

	newline(&pos);
	for (int i = 0; i < 256; i += 1) {
		putchar(&pos, i, i);
	}
	
	/*
	newline(&pos);
	for (int i = 0; i < 256; i += 1) {
		putchar(&pos, i, col);
	}
	
	newline(&pos);
	for (int i = 0; i < 256; i += 1) {
		putchar(&pos, 0xb0, i);
		putchar(&pos, 0xb1, i);
		putchar(&pos, 0xb2, i);
	} */

	return;
}


// strings no longer than 61??:  https://stackoverflow.com/questions/46759903/why-cant-i-make-a-char-array-longer-than-61-characters-in-c-using-section-da 