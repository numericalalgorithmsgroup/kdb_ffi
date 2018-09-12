/ FFI namespace
\l ffi.q


/ e04ra
/ Create function handle

/ Parameters
handle:1#0i
n:1#7i
ifail:1#1i

/ Initialize empty problem handle with N variables
.ffi.cf[(" ";`libnagc_nag.so`e04raf_)](handle;n;ifail)

show "e04raf() ifail ="
show ifail


/ e04rf
/ Quadratic objective function

/ Number of nonzero elements in the linear term c of objective function
nnzc:1#7i

/ Definition of sparse structure for the linear term c
idxc:7#1 2 3 4 5 6 7i
c:7#-200.0 -2000.0 -2000.0 -2000.0 -2000.0 400.0 400.0f

/ Number of nonzero elements in the upper triangular quadratic term H
nnzH:1#9i

/ Definition of sparse structure for the quadratic term H
irowH:9#1 2 3 3 4 5 6 6 7i
icolH:9#1 2 3 4 4 5 6 7 7i
H:9#2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0 2.0f

/ Add quadratic objective function to problem handle
.ffi.cf[(" ";`libnagc_nag.so`e04rff_)]
    (handle;nnzc;idxc;c;nnzH;irowH;icolH;H;ifail)

show "e04rff() ifail ="
show ifail


/ e04rh
/ Simple bounds for variable

/ Define the lower and upper bounds for variables
l_x:7#0.0      0.0 400.0 100.0    0.0    0.0    0.0f
u_x:7#200.0 2500.0 800.0 700.0 1500.0 1.0e25 1.0e25f

/ Add simple bounds to problem handle
.ffi.cf[(" ";`libnagc_nag.so`e04rhf_)](handle;n;l_x;u_x;ifail)

show "e04rhf() ifail ="
show ifail


/ e04rj
/ Linear constraints

/ Bounds for linear constraints
m_B:1#7i
l_B:7#-1.0e25 -1.0e25 -1.0e25 -1.0e25 -1.0e25 1500.0 250.0f
u_B:7# 2000.0  60.0    100.0   40.0    30.0   1.0e25 300.0f

/ Sparse structure for linear constraint matrix B
nnzB:1#41i
irowB:41#1 1 1 1 1 1 1  2 2 2 2 2 2 2  3 3 3 3 3 3  4 4 4 4 4
         5 5 5  6 6 6 6 6 6  7 7 7 7 7 7 7i
icolB:41#1 2 3 4 5 6 7  1 2 3 4 5 6 7  1 2 3 4 5 6  1 2 3 4 5
         1 4 5  1 2 3 4 5 6  1 2 3 4 5 6 7i
B:41#1.0  1.0  1.0  1.0  1.0  1.0  1.0
     0.15 0.04 0.02 0.04 0.02 0.01 0.03
     0.03 0.05 0.08 0.02 0.06 0.01
     0.02 0.04 0.01 0.02 0.02
     0.02 0.03           0.01
     0.70 0.75 0.80 0.75 0.80 0.97
     0.02 0.06 0.08 0.12 0.02 0.01 0.97f

/ Additional parameter for e04rjf
idlc:1#0i

/ Add linear constraints to problem handle
.ffi.cf[(" ";`libnagc_nag.so`e04rjf_)]
    (handle;m_B;l_B;u_B;nnzB;irowB;icolB;B;idlc;ifail)

show "e04rjf() ifail ="
show ifail


/ e04ry
/ Display problem handle

nout:1#6i
str:"overview; simple bounds; objective; linear constraints bounds; linear constraints detailed; options"
len_str:99i

/ Display contents of problem handle
.ffi.cf[(" ";`libnagc_nag.so`e04ryf_)]
    (handle;nout;str;ifail;len_str)

show "e04ryf() ifail = "
show ifail


/ Initial starting point
x:7#0.0f

/ Additional parameters for IPM solver
n_u:1#0i
u:1#0i
rinfo:32#0.0f  / vector of length 32
stats:32#0.0f  / vector of length 32
iuser:1#0i
ruser:1#0i
cpuser:1#0i    / same type as 'handle'

/ Invoke NAG Interior Point Method solver
.ffi.cf[(" ";`libnagc_nag.so`e04stf_)]
        (handle;
         (`libnag_nag.so`e04stv_; 1#"iffiifi";      " ");  / OBJFUN
         (`libnag_nag.so`e04stw_; 1#"ififiifi";     " ");  / OBJGRD
         (`libnag_nag.so`e04stx_; 1#"ififiifi";     " ");  / CONFUN
         (`libnag_nag.so`e04sty_; 1#"ififiifi";     " ");  / CONGRD
         (`libnag_nag.so`e04stz_; 1#"ifiiffifiifi"; " ");  / HESS
         (`libnag_nag.so`e04stu_; 1#"ifififfifi";   " ");  / MON
         n;x;n_u;u;rinfo;stats;iuser;ruser;cpuser;ifail
        )

/ Destroy problem handle and deallocate memory
.ffi.cf[(" ";`libnagc_nag.so`e04rzf_)](handle;ifail)

show "e04stf() ifail ="
show ifail


/ Display solution

show "Solution: x ="
show x

show "Objective function at final iteration:"
show rinfo[0]

/ Solution:
/ X = (0, 349.4, 648.85, 172.85, 407.52, 271.36, 150.02)


/ e04rz
/ Destroy problem handle and deallocate memory
.ffi.cf[(" ";`libnagc_nag.so`e04rzf_)](handle;ifail)

show "e04rzf() ifail ="
show ifail
