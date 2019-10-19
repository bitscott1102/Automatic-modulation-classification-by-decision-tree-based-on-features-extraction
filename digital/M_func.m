function M=M_func(s)    
h = [1/5,1/5,1/5,1/5,1/5];
s = filter(h,1,s);    %主要起到去噪的功能，否则结果会很不一样。
M = mean(abs(s));

