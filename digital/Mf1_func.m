function Mf1=Mf1_func(s,fs,Ac)
h=hilbert(s);
f=dif(h,fs);
Mf1=M_func(A_func(f));