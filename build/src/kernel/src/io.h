#ifndef IO
#define IO

#include "math.h"

/* definitions */
#define CONSOLE_MEM (char*)0xb8000
#define CONSOLE_ROWS 80
#define CONSOLE_COLS 25
#define CONSOLE_MEM_MAX (char*)0xB8FA0  // ((CONSOLE_MEM + (CONSOLE_ROWS * CONSOLE_COLS * 2)))
/* constants */
static const char HEX_DIGITS[] = "0123456789abcdef";
/* functions */
// [new_line] (pos) => returns via arg
// rounding the memory address up to 160 (new line)
inline void new_line(char** pos) { *pos += (CONSOLE_ROWS * 2) - (((*pos) - CONSOLE_MEM) % (CONSOLE_ROWS * 2)); }
// [put_char] (pos, chr, col) => void
inline void put_char(char* pos, const char chr, const char col) { pos[0] = chr; pos[1] = col; }
void put_char_call(char* pos, const char chr, const char col);

// void print(char** pos, const char* restrict str, const char col);

// [char_color] (bg, fg) => uint8_t
inline uint8_t char_color(const uint8_t bg, const uint8_t fg) { return (bg << 4) | (fg >> 4); }


#endif

// TODO: to make put char safe add (pos = CLAMP(CONSOLE_MEM, pos, CONSOLE_MEM_MAX);)