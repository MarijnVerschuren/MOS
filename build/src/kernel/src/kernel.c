#include "math.h"
#include "io.h"



//const char HEX_DIGITS[] = "0123456789abcdef";
static inline void print_hex_8(char** pos, const uint8_t data) {
	put_char(pos, HEX_DIGITS[(data >> 4) & 0xf], 0x30);
	put_char(pos, HEX_DIGITS[data & 0xf], 0x30);
}
inline void print_hex_16(char** pos, const uint16_t data) {
	const uint8_t* data_ptr = &data;
	print_hex_8(pos, ((const uint8_t*)&data)[1]);
	print_hex_8(pos, ((const uint8_t*)&data)[0]);
}
inline void print_hex_32(char** pos, const uint32_t data) {
	const uint8_t* data_ptr = &data;
	print_hex_8(pos, ((const uint8_t*)&data)[3]);
	print_hex_8(pos, ((const uint8_t*)&data)[2]);
	print_hex_8(pos, ((const uint8_t*)&data)[1]);
	print_hex_8(pos, ((const uint8_t*)&data)[0]);
}
inline void print_hex_64(char** pos, const uint64_t data) {
	const uint8_t* data_ptr = &data;
	print_hex_8(pos, ((const uint8_t*)&data)[7]);
	print_hex_8(pos, ((const uint8_t*)&data)[6]);
	print_hex_8(pos, ((const uint8_t*)&data)[5]);
	print_hex_8(pos, ((const uint8_t*)&data)[4]);
	print_hex_8(pos, ((const uint8_t*)&data)[3]);
	print_hex_8(pos, ((const uint8_t*)&data)[2]);
	print_hex_8(pos, ((const uint8_t*)&data)[1]);
	print_hex_8(pos, ((const uint8_t*)&data)[0]);
}

void kernel() {
	char*	pos =			CONSOLE_MEM;
	// screen has exactly 2000 chars (80 x 25)

	
	for (uint8_t i = 0; i < 16; i += 1) {
		put_char(&pos, HEX_DIGITS[i], 0x30);
	}

	new_line(&pos);

	// this code only works when the line of code in the loop above is present
	uint64_t* pi_ptr = (uint64_t*)&PI;
	print_hex_64(&pos, *pi_ptr);

	new_line(&pos);

	
	f32_t ans = sin(PI);
	print_hex_32(&pos, *((uint32_t*)&ans));

	new_line(&pos);



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