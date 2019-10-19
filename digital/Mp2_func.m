function Mp2=Mp2_func(s,fs,fc) 
h=hilbert(s);
fai=fai0_func(h,fs,fc);
p1=A_func(fai);
Mp2=M_func(A_func(p1));%╧Фби©ия╜