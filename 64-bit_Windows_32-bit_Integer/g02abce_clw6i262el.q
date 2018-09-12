/ FFI namespace
\l ffi.q

/ Parameters
g:16#2.0 -1.0 0.0 0.0 -1.0 2.0 -1.0 0.0
     0.0 -1.0 2.0 -1.0 0.0 0.0 -1.0 2.0f
ldg:1#4i
n:1#4i
opt:1#"B"
alpha:1#0.02f
w:4#100.0 20.0 20.0 20.0f
errtol:1#0.0f
maxits:1#0j
maxit:1#0i
x:16#0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0
     0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0f
ldx:1#4i
iter:1#0i
feval:1#0j
nrmgrd:1#0.0f
ifail:1#0i
length_opt:1i

/ NAG routine call
.ffi.cf[(" ";`CLW6I262E_nag.dll`g02abf_)]
    (g;ldg;n;opt;alpha;w;errtol;maxits;maxit;x;ldx;iter;feval;nrmgrd;ifail;length_opt)

show "x = "
show x
