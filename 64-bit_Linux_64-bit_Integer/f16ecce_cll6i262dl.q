/ FFI namespace
\l ffi.q

/ Parameters
n:1#5j
alpha:1#3.0f
x:5#-6.0  4.5  3.7  2.1 -4.0f
incx:1#1j
beta:1#-1.0f
y:5#-5.1 -5.0  6.4 -2.4 -3.0f
incy:1#1j

/ NAG routine call
.ffi.cf[(" ";`libnagc_nag.so`f16ecf_)](n;alpha;x;incx;beta;y;incy)

show "y = "
show y
