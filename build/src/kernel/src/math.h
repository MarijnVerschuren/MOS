#ifndef MATH_LIB
#define MATH_LIB

/* definitions */
#define int8_t char
#define uint8_t unsigned char
#define int16_t short
#define uint16_t unsigned short
#define int32_t long
#define uint32_t unsigned long
#define int64_t long long
#define uint64_t unsigned long long

#define uint_t unsigned int
#define size_t uint32_t

#define f32_t float
#define f64_t double

/* macros */
#define ABS(x) (x > 0 ? x : -x)
#define MAX(a,b) ((a)>(b) ? (a) : (b))
#define MIN(a,b) ((a)<(b) ? (a) : (b))
#define CLAMP(a,b,c) (MIN(MAX(a, b), c))  // a < x < c

/* constants */
const static f64_t PI = 3.1415926535897932;  // 16 decimal points
/* functions */
inline f64_t sin(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fsin" : "=t"(y) : "0"(x));
	return y;
}
inline f64_t cos(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fcos" : "=t"(y) : "0"(x));
	return y;
}
inline f64_t tan(f64_t x) {
	return sin(x) / cos(x);
}
inline f64_t sqrt(f64_t x) {
	f64_t y;
	__asm__ __volatile__("fsqrt" : "=t"(y) : "0"(x));
}
// extern f64_t sin(f64_t);

#endif