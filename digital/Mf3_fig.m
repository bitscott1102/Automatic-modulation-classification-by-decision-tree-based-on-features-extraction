clear; 
fb = 500; fc = 2000; fs = 12000; Ac = 1; f1 = 500; f2 = 1000;
f3 = 1500; f4 = 2000; f4 = 2000; f5 = 750; f6 = 1250; f7 = 1750; f8 = 2250; 
for i = 1:30
    for k = 1:100
         d4 = randi([0,3],1,300); d8 = randi([0,7],1,300); 
         s2 = fsk4(d4,fb,f1,f2,f3,f4,fs,Ac); s3 = fsk8(d8,fb,f1,f2,f3,f4,f5,f6,f7,f8,fs,Ac); 
         ss2 = awgn(s2,i,'measured'); ss3 = awgn(s3,i,'measured'); 
         Maf32(k) = Mf3_func(ss2,fs,Ac); Maf33(k) = Mf3_func(ss3,fs,Ac); 
    end
    Mf32(i) = mean(Maf32); Mf33(i) = mean(Maf33); 
end
plot(Mf32,'-*'); hold on
plot(Mf33,'-^')
xlabel('snr'); ylabel('Mf3'); 
grid
legend('fsk4','fsk8',0); 