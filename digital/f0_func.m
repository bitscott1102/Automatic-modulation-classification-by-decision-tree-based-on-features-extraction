function f_cn1=f0_func(f)
f0=f-mean(f);
f_cn1=f0/mean(abs(f0));