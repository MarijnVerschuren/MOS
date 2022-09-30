#ifndef MEM_LIB
#define MEM_LIB

	#include "math.h"

	void memrst(void* const, const size_t);  // mem reset
	void memset(void* const, const uint8_t, const size_t);
	void memcpy(void* const, const void* const, const size_t);

#endif