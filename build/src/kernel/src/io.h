#ifndef IO
#define IO

	#include "math.h"
	#include "mem.h"

	// BUILD MODE
	#define GRAPHICS_MODE  // currently the boot sector and kernel are compiled in text mode
	// #define TEXT_MODE

	
	
	/* constants */
	extern const char* HEX_DIGITS;
	/* functions */
	void print_hex_16(uint8_t** pos, const uint16_t data);
	void print_hex_32(uint8_t** pos, const uint32_t data);
	void print_hex_64(uint8_t** pos, const uint64_t data);



	/* BUILD SPECIFIC */
	#ifdef GRAPHICS_MODE
	/* definitions */
	#define DISPLAY_MEM ((uint8_t*)0xa0000)
	#define DISPLAY_WIDTH 320
	#define DISPLAY_HEIGHT 200
	#define DISPLAY_SIZE 64000
	#define DISPLAY_MEM_MAX (uint8_t*)0xafa00  // ((DISPLAY_MEM + (DISPLAY_WIDTH * DISPLAY_HEIGHT)))
	
	#define DEFAULT_CHAR_SPACING 2
	#define DEFAULT_NEW_LINE_SPACING 8
	#define DEFAULT_CHAR_COLOR 0xf

	/* constants */
	extern const uint64_t PIXEL_CHARSET[128];

	/* functions */
	inline void put_pix_raw(uint8_t** pos, const uint8_t color) { *(*pos) = color; (*pos)++; }
	inline void put_pix(const uint8_t color, const uint16_t x, const uint16_t y) { *(DISPLAY_MEM + x + (y * DISPLAY_WIDTH)) = color; }
	inline void clear_screen() { memset(DISPLAY_MEM, 0x00, DISPLAY_SIZE); }  // TODO: make memset more efficient

	void put_char(uint8_t** pos, const char chr, const uint8_t spacing, const uint8_t color);
	void print(uint8_t** pos, const char* str, const uint8_t spacing, const uint8_t color);
	void new_line(uint8_t** pos, const uint8_t count);

	void print_hex_8(uint8_t** pos, const uint8_t data);

	#else
	/* definitions */
	#define DISPLAY_MEM (uint8_t*)0xb8000
	#define DISPLAY_WIDTH 80
	#define DISPLAY_HEIGHT 25
	#define DISPLAY_MEM_MAX (uint8_t*)0xb8fa0  // ((DISPLAY_MEM + (DISPLAY_WIDTH * DISPLAY_HEIGHT * 2)))

	#define DEFAULT_CHAR_COLOR 0x30
	/* functions */
	void put_char(uint8_t** pos, const char chr, const uint8_t col);									// [put_char] (pos, chr, col) => returns via arg (pos)
	void print(uint8_t** pos, const char* str, const uint8_t col);										// [print] (pos, chr, col) => returns via arg (pos)
	void new_line(uint8_t** pos, const uint8_t count);													// [new_line] (pos, count) => returns via arg (pos)
	inline uint8_t char_color(const uint8_t bg, const uint8_t fg) { return (bg << 4) | (fg >> 4); }		// [char_color] (bg, fg) => uint8_t
	// TODO: to make put char safe add (pos = CLAMP(DISPAY_MEM, pos, CONSOLE_MEM_MAX);)

	void print_hex_8(uint8_t** pos, const uint8_t data);
	
	#endif
#endif