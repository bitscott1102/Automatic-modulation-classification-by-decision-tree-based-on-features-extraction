clear;
close;
fb=500;fc=2000;fs=12000;Ac=1;f1=500;f2=1000;f3=1500;f4=2000;f5=750;f6=1250;f7=1750;f8=2250;
for i=1:30
    i
    for k=1:100
         d2=randi([0,1],1,300);d4=randi([0,3],1,300);d8=randi([0,7],1,300);
         s1=fsk2(d2,fb,f1,f4,fs,Ac);s2=fsk4(d4,fb,f1,f2,f3,f4,fs,Ac);s3=fsk8(d8,fb,f1,f2,f3,f4,f5,f6,f7,f8,fs,Ac);
         ss1=awgn(s1,i,'measured');ss2=awgn(s2,i,'measured');ss3=awgn(s3,i,'measured');
         Maf21(k)=Mf2_func(ss1,fs,Ac);
         Maf22(k)=Mf2_func(ss2,fs,Ac);
         Maf23(k)=Mf2_func(ss3,fs,Ac);
    end
    Mf21(i)=mean(Maf21);Mf22(i)=mean(Maf22);Mf23(i)=mean(Maf23);
    thr(i) = 0.4226;
end

plot(thr,'--','color','k','linewidth',2);
plot(Mf21,'-*','linewidth',2)
hold on
plot(Mf22,'-^','linewidth',2)
plot(Mf23,'-s','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('递归零中心归一化瞬时频率绝对值的平均值Mf2','FontWeight','bold');
grid
legend('2fsk','4fsk','8fsk','threshold',0);
axis([0,30,0.05,0.55]);
%line([0 30],[0.4185 0.4185],'color','k')