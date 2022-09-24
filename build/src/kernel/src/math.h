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
#define f32_t float
#define f64_t double
/* macros */
#define MAX(a,b) ((a)>(b) ? (a) : (b))
#define MIN(a,b) ((a)<(b) ? (a) : (b))
#define CLAMP(a,b,c) (MIN(MAX(a, b), c))  // a < x < c

/* constants */
const static f64_t PI = 3.1415926535897932;  // 16 decimal points
/* functions */
extern f32_t sin(f32_t);
// extern f64_t sin(f64_t);

#endif