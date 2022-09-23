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
#define uint unsigned int
#define f32 float
#define f64 double
/* macros */
#define MAX(a,b) ((a)>(b) ? (a) : (b))
#define MIN(a,b) ((a)<(b) ? (a) : (b))
#define CLAMP(a,b,c) (MIN(MAX(a, b), c))  // a < x < c

/* constants */
const static double PI = 3.1415926535897932;  // 16 decimal points
/* functions */
extern f32 sin(f32);
// extern f64 sin(f64);

#endif