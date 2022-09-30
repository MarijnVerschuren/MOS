#include "mem.h"



void memrst(void* const ptr, const size_t size) {
	size_t l_size = size / 8;
	if (l_size) { for (size_t i = 0; i < l_size; i++) { ((uint64_t*)ptr)[i] = 0; } }
	for (size_t i = l_size * 8; i < size; i++) { ((uint8_t*)ptr)[i] = 0; }
}
void memset(void* const ptr, const uint8_t byte, const size_t size) {
	for (size_t i = 0; i < size; i++) { ((uint8_t*)ptr)[i] = byte; }
}
// add loop with larger numbers
void memcpy(void* const dst, const void* const src, const size_t size) {
	for (size_t i = 0; i < size; i++) { ((uint8_t*)dst)[i] = ((uint8_t*)src)[i]; }
}
