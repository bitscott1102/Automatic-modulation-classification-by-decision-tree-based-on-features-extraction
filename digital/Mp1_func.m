function Mp1=Mp1_func(s,fs,fc) 
h=hilbert(s);
fai=fai0_func(h,fs,fc);
p1=A_func(fai);
Mp1=M_func(p1);