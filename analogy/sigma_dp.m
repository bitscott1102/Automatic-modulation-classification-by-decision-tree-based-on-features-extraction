%%
clear;close;
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
%%

for i=1:30
    i
    for k=1:100
    s1 = am( x,xc,xs,fc,fs );s3 = dsb( x,xc,xs );%各种调制信号的生成
    
    ss1 = awgn(s1,i,'measured');
    ss3 = awgn(s3,i,'measured');   %awgn 加性高斯白噪声(Additive White Gaussian Noise)，i表示信噪比的大小；'measured'：函数将在加入噪声之前测定信号强度。
       
       Map11(k)=Mp1_func(ss1,fs,fc);Map13(k)=Mp1_func(ss3,fs,fc);
    end
    Mp11(i)=1-mean(Map11);Mp13(i)=1-mean(Map13);
    thr(i) = 0.7175;
end
plot(Mp11,'-*','linewidth',2)
hold on
plot(Mp13,'-^','linewidth',2)

plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('零中心非弱信号段瞬时相位非线性分量的标准偏差\sigma_d_p','FontWeight','bold');
grid
legend('am','dsb','threshold',0);
%line([0 30],[0.395 0.395],'color','k')
grid on
