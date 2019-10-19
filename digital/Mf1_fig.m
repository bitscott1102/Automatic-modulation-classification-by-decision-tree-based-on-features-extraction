clear; fb = 500; fc = 2000; fs = 12000; Ac = 1; f1 = 500; f2 = 1000; f3 = 1500; f4 = 2000; 
f5 = 750; f6 = 1250; f7 = 1750; f8 = 3250; 

for i = 1:30
    i
    for k = 1:100
        d2 = randi([0,1],1,300); d4 = randi([0,3],1,300); d8 = randi([0,7],1,300); 
        
        s1 = fsk2(d2,fb,f1,f4,fs,Ac); s2 = fsk4(d4,fb,f1,f2,f3,f4,fs,Ac); 
        s6 = psk8(d8,fb,fc,fs,Ac);
        s3 = psk2(d2,fb,fc,fs,Ac); s4 = psk4(d4,fb,fc,fs,Ac); 
        s5 = fsk8(d8,fb,f1,f2,f3,f4,f5,f6,f7,f8,fs,Ac); 
        
        ss1 = awgn(s1,i,'measured'); ss2 = awgn(s2,i,'measured'); 
        ss3 = awgn(s3,i,'measured'); ss4 = awgn(s4,i,'measured'); 
        ss5 = awgn(s5,i,'measured'); ss6 = awgn(s6,i,'measured');
        
        Maf11(k) = Mf1_func(ss1,fs,Ac); Maf12(k) = Mf1_func(ss2,fs,Ac); 
        Maf13(k) = Mf1_func(ss3,fs,Ac); Maf14(k) = Mf1_func(ss4,fs,Ac); 
        Maf15(k) = Mf1_func(ss5,fs,Ac); Maf16(k) = Mf1_func(ss6,fs,Ac);
        
    end
    
    Mf11(i) = mean(Maf11); Mf12(i) = mean(Maf12); Mf13(i) = mean(Maf13); 
    Mf14(i) = mean(Maf14); Mf15(i) = mean(Maf15); Mf16(i) = mean(Maf16);
    thr(i) = 0.2105;
end
plot(Mf11,'-*','linewidth',2)
hold on
plot(Mf12,'-^','linewidth',2)
plot(Mf13,'-s','linewidth',2)
plot(Mf14,'-d','linewidth',2)
plot(Mf15,'-p','linewidth',2)
plot(Mf16,'-p','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('零中心归一化瞬时频率绝对值的平均值Mf1','FontWeight','bold');

grid
legend('2fsk','4fsk','2psk','4psk','8fsk','8fsk','threshold',0); 
%line([0 30],[0.1815 0.1815],'color','k')