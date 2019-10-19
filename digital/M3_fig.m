clear; fb = 500; fc = 2000; fs = 12000; Ac = 1; 
for i = 1:30
    for k = 1:100
    d4 = randi([0,3],1,300); d8 = randi([0,7],1,300); 
    s2 = ask4(d4,fb,fc,fs,Ac); s3 = ask8(d8,fb,fc,fs,Ac); 
    ss2 = awgn(s2,i,'measured'); ss3 = awgn(s3,i,'measured'); 
    
    Ma32(k) = M3_func(ss2); Ma33(k) = M3_func(ss3); 
    end
    M32(i) = mean(Ma32); M33(i) = mean(Ma33); 
end
plot(M32,'-*'); hold on; 
plot(M33,'-^'); 
xlabel('snr'); ylabel('M3'); 
grid
legend('ask4','ask8',0); 