#include "math.h"
#include "io.h"



void put_pix(uint8_t** pos, const uint8_t pix) {
	*(*pos) = pix;
	*pos += 1;
}

void kernel() {
	uint8_t*	pos =			DISPLAY_MEM;
	
	pos = DISPLAY_MEM + (DISPLAY_WIDTH * 5);
	for (uint8_t i = 0; i < 128; i++) {
		put_char(&pos, i, DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	}

	pos += (2 * DISPLAY_WIDTH * DEFAULT_NEW_LINE_SPACING) - (pos - DISPLAY_MEM) % DISPLAY_WIDTH;
	
	uint64_t* pi_ptr = (uint64_t*)&PI;
	print_hex_64(&pos, *pi_ptr);

	pos += (2 * DISPLAY_WIDTH * DEFAULT_NEW_LINE_SPACING) - (pos - DISPLAY_MEM) % DISPLAY_WIDTH;

	put_char(&pos, 'H', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'e', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'l', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'l', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'o', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, ' ', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'W', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'o', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'r', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'l', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(&pos, 'd', DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);

	return;
}

/*
CalcSin
        fld     long [angle]            ; st(0) = angle
        fsin                            ; st(0) = sin(angle)  (angle is in radians)
        fstp    long [SinX]             ; SinX = sin(angle)
CalcCos
        fld     long [angle]            ; st(0) = angle
        fcos                            ; st(0) = cos(angle) (angle is again in radians)
        fstp    long [CosX]             ; CosX = cos(angle)
CalcTan
        fld     long [angle]            ; st(0) = angle
        fsincos                         ; st(0) = cos(angle);  st(1) = sin(angle)
        fdivrp  st1, st0                ; st(0) = st(1) / st(0)   ( = sin/cos )
        fstp    long [TanX]             ; TanX = tan(angle)
*/
// strings no longer than 61??:  https://stackoverflow.com/questions/46759903/why-cant-i-make-a-char-array-longer-than-61-characters-in-c-using-section-da 


// 33323130
// pmemsave 0xb8000 0x1fffffff qemu.mem  // ~ 512M
// HEX_DIGITS @ 0x2000 ????????????????

// https://imhex.werwolv.net/   // disassembler
// https://wiki.osdev.org/Expanded_Main_Page

// font maker:   https://apps.lospec.com/pixel-editor/