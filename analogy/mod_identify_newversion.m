%%姓名：周定宇     专业：通信与信息系统      学号：SQ10048101028
%%本程序设计了一个模拟调制制式的识别方法，通过提取各种调制方式已调信号
%%的特征参数，实现对各种调制方式的有效识别。
clc;
clear;
fc=10000;                                                        %载波频率
fs=40000;                                                        %信号采样率
n=1:100; 
x=cos(2*pi*n*2000/fs);                %调制信号
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs);
kf=(fc/fs)*2*pi/max(max(abs(x)));


k = 10;% 暂时
%AM
y1=am( x,xc,xs,fc,fs );y1 = awgn(y1,k,'measured');

%FM正交调制
y2=fm( xx,kf,xc,xs );y2 = awgn(y2,k,'measured');

%DSB正交调制
y3=dsb( x,xc,xs );y3 = awgn(y3,k,'measured');

%LSB正交调制
y4=lsb( x,xc,xs );y4 = awgn(y4,k,'measured');

%USB正交调制

y5 = usb( x,xc,xs ); y5 = awgn(y5,k,'measured');

%AM-FM正交调制
I6=2*cos(kf*xx)*2.*(1+0.9*x);   
Q6=-2*sin(kf*xx)*2.*(1+0.9*x);
y6=I6.*xc+Q6.*xs;y6 = awgn(y6,k,'measured');
y=[y1;y2;y3;y4;y5;y6];

%% 特征提取

% 零中心归一化瞬时幅度之谱密度的最大值
rmax1=zdy3(y1,N);
rmax2=zdy3(y2,N);
rmax3=zdy3(y3,N);
rmax4=zdy3(y4,N);
rmax5=zdy3(y5,N);
rmax6=zdy3(y6,N);
rmax=[rmax1,rmax2,rmax3,rmax4,rmax5,rmax6];
disp('      AM        FM        DSB       LSB       USB      AM-FM')
disp('rmax值:')
disp(rmax)
%提取相位
phase1=zdy4(y1,N);
phase2=zdy4(y2,N);
phase3=zdy4(y3,N);
phase4=zdy4(y4,N);
phase5=zdy4(y5,N);
phase6=zdy4(y6,N);
phase=[phase1;phase2;phase3;phase4;phase5;phase6];
b1=zdy5(y1,N);
b2=zdy5(y2,N);
b3=zdy5(y3,N);
b4=zdy5(y4,N);
b5=zdy5(y5,N);
b6=zdy5(y6,N);
b=[b1;b2;b3;b4;b5;b6];
%零中心非弱信号段瞬时相位非线性分量绝对值的标准偏差
ap1=zdy(b1,phase1);
ap2=zdy(b2,phase2);
ap3=zdy(b3,phase3);
ap4=zdy(b4,phase4);
ap5=zdy(b5,phase5);
ap6=zdy(b6,phase6);
ap=[ap1,ap2,ap3,ap4,ap5,ap6]
%提取零中心非弱信号段瞬时相位非线性分量绝对值的标准偏差
dp1=zdy1(b1,phase1);
dp2=zdy1(b2,phase2);
dp3=zdy1(b3,phase3);
dp4=zdy1(b4,phase4);
dp5=zdy1(b5,phase5);
dp6=zdy1(b6,phase6);
dp=[dp1,dp2,dp3,dp4,dp5,dp6]
%%谱对称性P                                              
fcn=fc*N/fs-1;
P1=zdy2(y1,fcn);
P2=zdy2(y2,fcn);
P3=zdy2(y3,fcn);
P4=zdy2(y4,fcn);
P5=zdy2(y5,fcn);
P6=zdy2(y6,fcn);
P=[P1,P2,P3,P4,P5,P6]







