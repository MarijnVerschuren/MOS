#include "math.h"
#include "io.h"



void put_pix(uint8_t** pos, const uint8_t pix) {
	*(*pos) = pix;
	*pos += 1;
}

void kernel() {
	uint8_t*	pos =			GRAPHICS_MODE_DISPLAY_MEM;
	// screen has exactly 2000 chars (80 x 25)

	/*
	for (uint8_t i = 0; i < 16; i += 1) {
		put_char(&pos, HEX_DIGITS[i], 0x30);
	}
	new_line(&pos);
	*/


	for (uint16_t i = 0; i < 320 * 200; i += 1) {
		put_pix(&pos, i & 0xff);
	}
	

	/*
	for (uint8_t i = 0; i < 0xff; i += 1) {
		for (uint8_t y = 0; y < 0xf; y += 1) {
			for (uint8_t x = 0; x < 0xf; x += 1) {
				put_pix(&pos, (x << 4) | y);
			}
		}
	}
	*/

	/*
	uint64_t* pi_ptr = (uint64_t*)&PI;
	print_hex_64(&pos, *pi_ptr);

	new_line(&pos);
	*/

	
	/*f32_t ans = sin(PI);
	print_hex_32(&pos, *((uint32_t*)&ans));

	new_line(&pos);*/



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