close
clear;fb=500;fc=2000;fs=12000;Ac=1;
for i=1:30  %i表示为信噪比从0db取到30db
    i
    for k=1:100    
    d2=randi([0,1],1,300);
    d4=randi([0,3],1,300);
    d8=randi([0,7],1,300);
    s1=ask2(d2,fb,fc,fs,Ac);s2=ask4(d4,fb,fc,fs,Ac);s3=ask8(d8,fb,fc,fs,Ac);
    ss1=awgn(s1,i,'measured');ss2=awgn(s2,i,'measured');ss3=awgn(s3,i,'measured');%加噪
    
    Ma21(k)=M2_func(ss1);Ma22(k)=M2_func(ss2);Ma23(k)=M2_func(ss3);
    end
    M21(i)=mean(Ma21);M22(i)=mean(Ma22);M23(i)=mean(Ma23);
    thr(i) = 0.306;
end
plot(M21,'-*','linewidth',2)
hold on
plot(M22,'-^','linewidth',2)
%plot(M23,'-s','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('递归零中心归一化瞬时幅度绝对值的平均值M2','FontWeight','bold');
grid
legend('2ask','4ask','threshold',0);
%line([0 30],[0.306 0.306],'color','k',)