clear all
close all
clc
fc=10000;                                     %载波频率Fc为150khz
fs=40000;                                    %信号采样率12000khz
n=1:100; 
x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);%调制信号
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
Ns = 1000;%进行1000的实验，产生1000次的调制信号
%对调制信号进行积分，此处是模仿mode_identify的代码，还未完全理解
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs);
kf=(fc/fs)*2*pi/max(max(abs(x)));%kf为调频灵敏度
fcn=fc*N/fs-1;

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
    
    Ma21(k) = zdy2(ss1,fcn);Ma22(k) = zdy2(ss2,fcn);Ma23(k) = zdy2(ss3,fcn);
    Ma24(k) = zdy2(ss4,fcn);Ma25(k) = zdy2(ss5,fcn);
   end
    
   M21(i) = abs(mean(Ma21));M22(i) = abs(mean(Ma22));M23(i) = abs(mean(Ma23));
   M24(i) = abs(mean(Ma24));M25(i) = abs(mean(Ma25));%取平均值，使得一个信噪比对应一个值
   thr(i) = 0.32;
end

plot(M21,'-*','linewidth',2)
hold on
plot(M22,'-^','linewidth',2)
plot(M23,'-s','linewidth',2)
plot(M24,'-d','linewidth',2)
plot(M25,'-p','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('谱对称性的绝对值|P|','FontWeight','bold');
grid
legend('am','fm','dsb','lsb','usb','threshold',0);
%画两条判决线
%line([0 30],[2.7 2.7],'color','k')
%line([0 30],[0.195 0.195],'color','r')


%% 判决结果rmax取2.7