#include "math.h"
#include "io.h"



// const char* HEX_DIGITS = "0123456789abcdef";

void put_char_call(char* pos, const char chr, const char col) { pos[0] = chr; pos[1] = col; }

/*void print(char** pos, const char* restrict str, const char col) {
	while (*str) {
		if (*str == '\n') { new_line(pos); }
		else { put_char(*pos, *str, col); *pos += 2; }
		str += 1;  // get the next char
	}
}*/