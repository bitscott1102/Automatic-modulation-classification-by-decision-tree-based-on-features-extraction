function Mf2=Mf2_func(s,fs,Ac)
h=hilbert(s);
f=dif(h,fs);
f0=f0_func(f);
Mf2=M_func(A_func(f0));