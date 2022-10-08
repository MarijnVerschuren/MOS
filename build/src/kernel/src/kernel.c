#include "math.h"
#include "mem.h"
#include "io.h"


void print_test() {
	uint8_t*	pos =			DISPLAY_MEM;

	for (uint8_t i = 0; i < 0xff; i++) {
		*pos = i;
		pos++;
	} *pos = 0xff; pos++;

	new_line(&pos, DEFAULT_NEW_LINE_SPACING);
	for (uint8_t i = 0; i < 128; i++) {
		put_char(&pos, i, DEFAULT_CHAR_SPACING, i);
	}

	/*
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
	*/

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	print(&pos, "Hello World!", DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);

	new_line(&pos, DEFAULT_NEW_LINE_SPACING * 2);
	print(&pos, "Printing text using pixels!!", DEFAULT_CHAR_SPACING, 0x2e);

	return;
}


void splash() {	
	uint8_t*	pos =			DISPLAY_MEM;
	
	uint16_t width = 320;			// columns
	uint16_t height = 200;			// rows

	uint16_t x_start = 0;
	uint16_t y_start = 0;

	uint16_t x_offset = width / 2;
	uint16_t y_offset = height / 2;

	// these three variables define a rotation from 0 to 2pi
	const float theta_spacing = 0.01;	//0.01;	// angle step in (?) axis (or part of donut?)
	const float phi_spacing = 0.01;		//0.01;	// angle step in (?) axis (or part of donut?)
	const float limit = PI * 2;			// max angle

	// pixel luminance
	uint8_t plum[12] = {0x10, 0x12, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1d, 0x1e};

	float	z_buffer[DISPLAY_SIZE];
	uint8_t	frame_buffer[DISPLAY_SIZE];

	float A = 0, B = 0;		// for the rotation animation
	float c, d, e, f, g, h, k, l, m, n, o;
	int32_t x, y, z, lum;
	int32_t x_2D = x_start, y_2D = y_start;
	while (1) {
		// clear buffers
		memrst(z_buffer, DISPLAY_SIZE * 4);
		memrst(frame_buffer, DISPLAY_SIZE);

		for (float i = 0; i < limit; i += theta_spacing) {
			for (float j = 0; j < limit; j += phi_spacing) {
				c = sin(i);
				d = cos(j);
				e = sin(A);
				f = sin(j);
				g = cos(A);
				h = d + 2;
				k = 1 / (c * h * e + f * g + 10);
				l = cos(i);
				m = cos(B);
				n = sin(B);
				o = c * h * g - f * e;
				x = x_offset + 160 * k * (l * h * m - o * n);	// 3D x cord (after rotation)
				y = y_offset + 160 * k * (l * h * n + o * m);	// 3D y cord (after rotation)
				z = x + width * y;								// index in z_buffer (after rotation)
				lum = 8 * ((f * e - c * d * g) * m - c * d * e - f * g - l * d * n);	// pixel luminance index 
				if (height > y && y > 0 && width > x && x > 0 && k > z_buffer[z]) {
					z_buffer[z] = k;
					frame_buffer[z] = plum[lum > 0 ? lum : 0];
				}
			}
		}
		
		for (uint16_t i = 0; i < DISPLAY_SIZE; i++) {
			put_pix_raw(&pos, i % width ? frame_buffer[i] : 0x0);
		}
		A += 0.128;
		B += 0.064;
		pos = DISPLAY_MEM;
	}
}


void kernel() {
	print_test();
	for (uint64_t i = 0; i < 0x1ffffff; i++) { sin(i); }  // DELAY!!
	splash();  // TODO: give donut a 128^2 window
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