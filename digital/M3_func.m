function M3=M3_func(s)
h=hilbert(s);
a1=A_func(h);a2=A_func(a1);a3=A_func(a2);%��M2_func��M3_func�����Ƴ�һЩMn_func�Ĺ���
M3=M_func(a3);