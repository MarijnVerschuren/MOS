#ifndef IO
#define IO

	#include "math.h"

	// display mode select
	#define GRAPHICS_MODE  // currently the boot sector and kernel are compiled in text mode
	// #define TEXT_MODE


	#ifdef GRAPHICS_MODE
	/* definitions */
	#define GRAPHICS_MODE_DISPLAY_MEM ((uint8_t*)0xa0000)
	#define DISPLAY_WIDTH 320
	#define DISPLAY_HEIGHT 200
	#define DISPLAY_MEM_MAX (uint8_t*)0xafa00  // ((DISPLAY_MEM + (DISPLAY_WIDTH * DISPLAY_HEIGHT)))
	
	#define DEFAULT_CHAR_SPACING 2
	#define DEFAULT_CHAR_COLOR 0xf

	/* constants */
	extern const uint64_t PIXEL_CHARSET[128];

	/* functions */
	void put_char(uint8_t** pos, const char ch, const uint8_t spacing, const uint8_t color);

	#else
	/* definitions */
	#define DISPLAY_MEM (uint8_t*)0xb8000
	#define DISPLAY_WIDTH 80
	#define DISPLAY_HEIGHT 25
	#define DISPLAY_MEM_MAX (uint8_t*)0xb8fa0  // ((DISPLAY_MEM + (DISPLAY_WIDTH * DISPLAY_HEIGHT * 2)))

	/* functions */
	// [new_line] (pos) => returns via arg
	inline void new_line(uint8_t** pos) { *pos += (TEXT_MODE_ROWS * 2) - (((*pos) - DISPAY_MEM) % (TEXT_MODE_ROWS * 2)); }
	// [put_char] (pos, chr, col) => void
	inline void put_char(uint8_t** pos, const char chr, const uint8_t col) { (*pos)[0] = chr; (*pos)[1] = col; *pos += 2; }
	// [char_color] (bg, fg) => uint8_t
	inline uint8_t char_color(const uint8_t bg, const uint8_t fg) { return (bg << 4) | (fg >> 4); }
	// TODO: to make put char safe add (pos = CLAMP(DISPAY_MEM, pos, CONSOLE_MEM_MAX);)
	inline void print_hex_8(uint8_t** pos, const uint8_t data) {
		put_char(pos, HEX_DIGITS[(data >> 4) & 0xf], 0x30);
		put_char(pos, HEX_DIGITS[data & 0xf], 0x30);
	}
	inline void print_hex_16(uint8_t** pos, const uint16_t data) {
		const uint8_t* data_ptr = (uint8_t*)&data;
		print_hex_8(pos, ((const uint8_t*)&data)[1]);
		print_hex_8(pos, ((const uint8_t*)&data)[0]);
	}
	inline void print_hex_32(uint8_t** pos, const uint32_t data) {
		const uint8_t* data_ptr =(uint8_t*) &data;
		print_hex_8(pos, ((const uint8_t*)&data)[3]);
		print_hex_8(pos, ((const uint8_t*)&data)[2]);
		print_hex_8(pos, ((const uint8_t*)&data)[1]);
		print_hex_8(pos, ((const uint8_t*)&data)[0]);
	}
	inline void print_hex_64(uint8_t** pos, const uint64_t data) {
		const uint8_t* data_ptr = (uint8_t*)&data;
		print_hex_8(pos, ((const uint8_t*)&data)[7]);
		print_hex_8(pos, ((const uint8_t*)&data)[6]);
		print_hex_8(pos, ((const uint8_t*)&data)[5]);
		print_hex_8(pos, ((const uint8_t*)&data)[4]);
		print_hex_8(pos, ((const uint8_t*)&data)[3]);
		print_hex_8(pos, ((const uint8_t*)&data)[2]);
		print_hex_8(pos, ((const uint8_t*)&data)[1]);
		print_hex_8(pos, ((const uint8_t*)&data)[0]);
	}
	#endif

	/* constants */
	extern const char* HEX_DIGITS;
#endif