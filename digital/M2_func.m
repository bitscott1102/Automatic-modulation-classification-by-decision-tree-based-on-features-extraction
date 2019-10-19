function M2=M2_func(s)
h=hilbert(s);
a1=A_func(h);a2=A_func(a1);
M2=M_func(a2);