#include "math.h"
#include "io.h"



/* constants */
const char* HEX_DIGITS = "0123456789abcdef";
/* functions */
void print_hex_16(uint8_t** pos, const uint16_t data) {
	const uint8_t* data_ptr = (uint8_t*)&data;
	print_hex_8(pos, ((const uint8_t*)&data)[1]);
	print_hex_8(pos, ((const uint8_t*)&data)[0]);
}
void print_hex_32(uint8_t** pos, const uint32_t data) {
	const uint8_t* data_ptr =(uint8_t*) &data;
	print_hex_8(pos, ((const uint8_t*)&data)[3]);
	print_hex_8(pos, ((const uint8_t*)&data)[2]);
	print_hex_8(pos, ((const uint8_t*)&data)[1]);
	print_hex_8(pos, ((const uint8_t*)&data)[0]);
}
void print_hex_64(uint8_t** pos, const uint64_t data) {
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



/* BUILD SPECIFIC */
#ifdef GRAPHICS_MODE
/* constants */
const uint64_t PIXEL_CHARSET[128] = {
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x00,			0x00,			0x00,			0x00,
	0x03,			0x5f01,			0x2d03,			0x295f57d4a05,
	0x11f4717c405,	0x67222227305,	0x59359152605,	0x301,
	0x255602,		0x1aa902,		0x554003,		0x2e8003,
	0x6001,			0xe0003,		0x4001,			0x4a4a403,
	0x699999604,	0xf44456404,	0xf12489604,	0x698689604,
	0x444f56404,	0x698711f04,	0x699719604,	0x222448f04,
	0x699699604,	0x698e99604,	0x2201,			0x6201,
	0x222a003,		0x71c003,		0xa88803,		0x202489604,
	0x383dae62e05,	0x4631fc62e05,	0x3e317c62f05,	0x3a210862e05,
	0x3e318c62f05,	0x7c217843f05,	0x4217843f05,	0x3a31c862e05,
	0x4631fc63105,	0x7c842109f05,	0x19284211f05,	0x45251953105,
	0x7c210842105,	0x4631aee3105,	0x4639ace3105,	0x3a318c62e05,
	0x4217c62f05,	0x59358c62e05,	0x45257c62f05,	0x3a307062e05,
	0x10842109f05,	0x3a318c63105,	0x11518c63105,	0x2ab58c63105,
	0x462a22a3105,	0x108422a3105,	0x7c222221f05,	0x355702,
	0x12248903,		0x3aab02,		0x2a03,			0x7c000000005,
	0x902,			0xe999e0004,	0x799971104,	0xe111e0004,
	0xe999e8804,	0xe1f960004,	0x222272c04,	0x68e999e04,
	0x999971104,	0x1d24c203,		0xe498403,		0x953591104,
	0x1d249303,		0x56b5abc0005,	0x999970004,	0x699960004,
	0x117999704,	0x88e999e04,	0x111970004,	0x7861e0004,
	0xc22272204,	0xe99990004,	0x259990004,	0x2ab58c40005,
	0x996990004,	0x68e999904,	0xf168f0004,	0x11229403,
	0x7f01,			0x5289103,		0x8a880005,		0x0
};  // ascii pixel data (add other 127 chars + edit some undefined chars (0x00))


void put_char(uint8_t** pos, const char chr, const uint8_t spacing, const uint8_t color) {
	// loading character data
	uint64_t pixel_data = PIXEL_CHARSET[(uint8_t)chr];
	uint8_t char_width = pixel_data & 0xff;
	// calculating if the char will still fit on this line
	uint16_t space = DISPLAY_WIDTH - ((*pos - DISPLAY_MEM) % DISPLAY_WIDTH);
	uint32_t add = char_width + spacing;
	if (add > space && char_width < space) { add = space - 1; }
	else if ((*pos - DISPLAY_MEM) % DISPLAY_WIDTH > ((*pos + add) - DISPLAY_MEM) % DISPLAY_WIDTH) { *pos += DEFAULT_NEW_LINE_SPACING * DISPLAY_WIDTH + space; }
	// setting the pointer vriable and return value (pos)
	uint8_t* ptr = *pos;
	*pos += add;
	// preparing pixel data and checking if there are pixels to draw
	pixel_data >>= 8;  // shift char width out
	if (!pixel_data) { return; }
	// setting the char width (max 8) and starting the pixel drawing loop
	char_width = MIN(char_width, 8);  // data can only be 8 bits wide
	for (uint8_t y = 0; y < 7; y++) {
		for (uint8_t x = 0; x < char_width; x++) {
			if ((pixel_data >> x) & 0x1) {
				*ptr = color;
			}
			ptr++;
		}
		pixel_data >>= char_width;
		ptr += DISPLAY_WIDTH - char_width;
	}
}

void print(uint8_t** pos, const char* str, const uint8_t spacing, const uint8_t color) {
	while (*str) { put_char(pos, *str++, spacing, color); }
}

void new_line(uint8_t** pos, const uint8_t count) {
	*pos += (DISPLAY_WIDTH * count) - ((*pos - DISPLAY_MEM) % DISPLAY_WIDTH);
}

void print_hex_8(uint8_t** pos, const uint8_t data) {
	put_char(pos, HEX_DIGITS[(data >> 4) & 0xf], DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
	put_char(pos, HEX_DIGITS[data & 0xf], DEFAULT_CHAR_SPACING, DEFAULT_CHAR_COLOR);
}

#else  // Text mode
void put_char(uint8_t** pos, const char chr, const uint8_t col) {
	(*pos)[0] = chr;
	(*pos)[1] = col;
	*pos += 2;
}

void print(uint8_t** pos, const char* str, const uint8_t col) {
	while (*str) { put_char(pos, *str++, col); }
}

void new_line(uint8_t** pos, const uint8_t count) {
	*pos += (TEXT_MODE_ROWS * 2) - (((*pos) - DISPAY_MEM) % (TEXT_MODE_ROWS * 2));
}

void print_hex_8(uint8_t** pos, const uint8_t data) {
	put_char(pos, HEX_DIGITS[(data >> 4) & 0xf], DEFAULT_CHAR_COLOR);
	put_char(pos, HEX_DIGITS[data & 0xf], DEFAULT_CHAR_COLOR);
}

#endif
// 00000000			00...00 
// char_width		data (data can only be 8 wide)