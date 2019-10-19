clear all
close all
clc
fc=10000;                                     %载波频率Fc为150khz
fs=40000;                                    %信号采样率12000khz
n=1:100; 
x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs); %调制信号
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
Ns = 1000;%进行1000的实验，产生1000次的调制信号
%对调制信号进行积分，此处是模仿mode_identify的代码，还未完全理解
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs);

kf=(fc/fs)*2*pi/max(max(abs(x)));%kf为调频灵敏度

for i  =  1:30
    i
   for k = 1:100 %该循环产生在相同信噪比下的调制信号组
       k;
       
     %% 产生信号
    
    s1 = am( x,xc,xs,fc,fs );s2 = fm( xx,kf,xc,xs );s3 = dsb( x,xc,xs );
    s4 = lsb( x,xc,xs );s5 = usb( x,xc,xs );    %各种调制信号的生成

    ss1 = awgn(s1,i,'measured');ss2 = awgn(s2,i,'measured');
    ss3 = awgn(s3,i,'measured');ss4 = awgn(s4,i,'measured');
    ss5 = awgn(s5,i,'measured');    %awgn 加性高斯白噪声(Additive White Gaussian Noise)，i表示信噪比的大小；'measured'：函数将在加入噪声之前测定信号强度。
    
    Ma11(k) = zdy3(ss1,N);Ma12(k) = zdy3(ss2,N);Ma13(k) = zdy3(ss3,N);
    Ma14(k) = zdy3(ss4,N);
    Ma15(k) = zdy3(ss5,N);
   end
    
   M11(i) = mean(Ma11);M12(i) = mean(Ma12);M13(i) = mean(Ma13);
   M14(i) = mean(Ma14);M15(i) = mean(Ma15);%取平均值，使得一个信噪比对应一个值
   thr(i) = 14.185;
end

plot(M11,'-*','linewidth',2)
hold on
plot(M12,'-^','linewidth',2)
plot(M13,'-s','linewidth',2)
plot(M14,'-d','linewidth',2)
plot(M15,'-p','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('零中心归一化瞬时幅度之谱密度的最大值\gamma max','FontWeight','bold');
grid
legend('am','fm','dsb','lsb','usb','threshold',0);


%% 判决结果rmax取14.185