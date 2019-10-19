clear;close;fb=500;fc=2000;fs=12000;Ac=1;
for i=1:30
    i
    for k=1:100
    d4=randi([0,3],1,300);d8=randi([0,7],1,300);
    s4=psk4(d4,fb,fc,fs,Ac);s5=psk8(d8,fb,fc,fs,Ac);
    ss4=awgn(s4,i,'measured');ss5=awgn(s5,i,'measured');
    Map24(k)=Mp2_func(ss4,fs,fc);Map25(k)=Mp2_func(ss5,fs,fc);
    end
    Mp24(i)=mean(Map24);Mp25(i)=mean(Map25);
    thr(i) = 0.3870;
end
plot(Mp24,'-*','linewidth',2);hold on;
plot(Mp25,'-^','linewidth',2);
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('递归零中心归一化瞬时幅度绝对值的平均值Mp2','FontWeight','bold');%%%%%%%%%%%%%%%%%%%
grid
legend('4psk','8psk','threshold',0);
%line([0 30],[0.404 0.404],'color','k')