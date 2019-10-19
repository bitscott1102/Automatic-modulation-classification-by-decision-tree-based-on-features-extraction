function so=dif(s,fs,Ac)
a=diff(s);
aa1=fs/2/pi/mean(abs(s))*abs(a);
h=[1/4,1/4,1/4,1/4];so=filter(h,1,aa1);