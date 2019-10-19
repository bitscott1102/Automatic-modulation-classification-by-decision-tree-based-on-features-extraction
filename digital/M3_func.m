function M3=M3_func(s)
h=hilbert(s);
a1=A_func(h);a2=A_func(a1);a3=A_func(a2);%由M2_func和M3_func可以推出一些Mn_func的规律
M3=M_func(a3);