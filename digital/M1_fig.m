
clear all;
close all;
fb  =  500;  fc  =  2000;   fs  =  12000; Ac  =  1; f1  =  500;    f2  =  1000; f3  =  1500;  f4  =  2000;

for i  =  1:30
    i
   for k = 1:100 %该循环产生在相同信噪比下的调制信号组
       k;
    d2 = randi([0,1],1,300);d4 = randi([0,3],1,300);d16 = randi([0,15],1,300);d8 = randi([0,7],1,300); %#ok<*DRNDINT>，生成多进制序列
    
    s1 = ask2(d2,fb,fc,fs,Ac);s2 = ask4(d4,fb,fc,fs,Ac);s3 = qam16(d16,fb,fc,fs,Ac);
    s4 = fsk4(d4,fb,f1,f2,f3,f4,fs,Ac);s5 = psk8(d8,fb,fc,fs,Ac);   %各种调制信号的生成，结合课件和代码理解。尤其是qam16正交调制，注意是幅度和角度一起变化，根据星座图来理解
    
    ss1 = awgn(s1,i,'measured');ss2 = awgn(s2,i,'measured');
    ss3 = awgn(s3,i,'measured');ss4 = awgn(s4,i,'measured');
    ss5 = awgn(s5,i,'measured');    %awgn 加性高斯白噪声(Additive White Gaussian Noise)，i表示信噪比的大小；'measured'：函数将在加入噪声之前测定信号强度。
    
    Ma11(k) = M1_func(ss1);Ma12(k) = M1_func(ss2);Ma13(k) = M1_func(ss3);
    Ma14(k) = M1_func(ss4);Ma15(k) = M1_func(ss5);
   end
    
   M11(i) = mean(Ma11);M12(i) = mean(Ma12);M13(i) = mean(Ma13);
   M14(i) = mean(Ma14);M15(i) = mean(Ma15);%取平均值，使得一个信噪比对应一个值
   
   thr_1(i) = 0.301;%%%%%%%%%%%%%%%%%%%%%%%
   thr_2(i) = 0.2345;
end

%%%%%%%%%%%%%,'linewidth',2%%%%%%%%%%%%%%
plot(M11,'-*','linewidth',2)
hold on
plot(M12,'-^','linewidth',2)
plot(M13,'-s','linewidth',2)
plot(M14,'-d','linewidth',2)
plot(M15,'-p','linewidth',2)

plot(thr_1,'--','color','k','linewidth',2);
plot(thr_2,'--','color','k','linewidth',2);%%%%%%%%%%%%%%%%%%%

xlabel('SNR(dB)');ylabel('零中心归一化瞬时幅度绝对值的平均值M1','FontWeight','bold');%%%%%%%%%%%%%%%%%%%



grid

%%%%%%%%%%%%%
legend('2ask','4ask','16qam','4fsk','4psk','threshold1','threshold2',0);
%%%%%%%%%%%%%%%%5

%画两条判决线
%line([0 30],[0.325 0.325],'color','k')
%line([0 30],[0.195 0.195],'color','r')