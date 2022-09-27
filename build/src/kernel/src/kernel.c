#include "math.h"
#include "io.h"



void kernel() {
	uint8_t*	pos =			DISPLAY_MEM;
	
	new_line(&pos, DEFAULT_NEW_LINE_SPACING);
	for (uint8_t i = 0; i < 128; i++) {
		put_char(&pos, i, DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	}

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	uint64_t* pi_ptr = (uint64_t*)&PI;
	print_hex_64(&pos, *pi_ptr);

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	f64_t sin_hp = sin(PI / 2);
	uint64_t* sin_hp_ptr = (uint64_t*)&sin_hp;
	print_hex_64(&pos, *sin_hp_ptr);

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	f64_t cos_hp = cos(PI / 2);
	uint64_t* cos_hp_ptr = (uint64_t*)&cos_hp;
	print_hex_64(&pos, *cos_hp_ptr);

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	f64_t tan_hp = tan(PI / 2);
	uint64_t* tan_hp_ptr = (uint64_t*)&tan_hp;
	print_hex_64(&pos, *tan_hp_ptr);

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	print(&pos, "Hello World!", DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);

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