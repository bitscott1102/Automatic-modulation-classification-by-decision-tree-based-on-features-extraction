clear;close;fb=500;fc=2000;fs=12000;Ac=1;
for i=1:30
    i
    for k=1:100
       d2=randi([0,1],1,300);d4=randi([0,3],1,300);d8=randi([0,7],1,300);
       s3=psk2(d2,fb,fc,fs,Ac);s4=psk4(d4,fb,fc,fs,Ac);s5=psk8(d8,fb,fc,fs,Ac);
       ss3=awgn(s3,i,'measured');ss4=awgn(s4,i,'measured');ss5=awgn(s5,i,'measured');
       
       Map13(k)=Mp1_func(ss3,fs,fc);Map14(k)=Mp1_func(ss4,fs,fc);Map15(k)=Mp1_func(ss5,fs,fc);
    end
    Mp13(i)=mean(Map13);Mp14(i)=mean(Map14);Mp15(i)=mean(Map15);
    thr(i) = 0.43505;
end
plot(Mp13,'-*','linewidth',2)
hold on
plot(Mp14,'-^','linewidth',2)
plot(Mp15,'-s','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('零中心归一化瞬时相位绝对值的平均值Mp1','FontWeight','bold');
grid
legend('2psk','4psk','8psk','threshold',0);
%line([0 30],[0.395 0.395],'color','k')
grid on
