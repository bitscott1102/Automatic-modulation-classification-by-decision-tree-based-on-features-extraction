clear all

load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amdsb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amssb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_wbfm_20.mat')

fc=10000;                                     %�ز�Ƶ��FcΪ150khz
fs=40000;                                    %�źŲ�����12000khz
n=1:100; 
x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);  %�����ź�
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
Ns = 1000;%����1000��ʵ�飬����1000�εĵ����ź�
%�Ե����źŽ��л��֣��˴���ģ��mode_identify�Ĵ��룬��δ��ȫ���
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs);
kf=(fc/fs)*2*pi/max(max(abs(x)));%kfΪ��Ƶ������
fcn=fc*N/fs-1;

close all
clc

for i  = 1:20;
    i
    i_1 = i./2+10;
   for k = 1:100 %��ѭ����������ͬ������µĵ����ź���
       k;
       
     %% �����ź�
    
%     s1 = am( x,xc,xs,fc,fs );s2 = fm( xx,kf,xc,xs );s3 = dsb( x,xc,xs );
%     s4 = lsb( x,xc,xs );s5 = usb( x,xc,xs );    %���ֵ����źŵ�����
%     
%     ss1 = awgn(s1,i,'measured');ss2 = awgn(s2,i,'measured');
%     ss3 = awgn(s3,i,'measured');ss4 = awgn(s4,i,'measured');
%     ss5 = awgn(s5,i,'measured');    %awgn ���Ը�˹������(Additive White Gaussian Noise)��i��ʾ����ȵĴ�С��'measured'���������ڼ�������֮ǰ�ⶨ�ź�ǿ�ȡ�
        ss1 = data_amdsb_20(10,:,i);
        ss2 = data_amssb_20(10,:,i);
        ss3 = data_wbfm_20(10,:,i);
        Ma21(k) = zdy2(ss1,fcn);Ma22(k) = zdy2(ss2,fcn);Ma23(k) = zdy2(ss3,fcn);
%     Ma24(k) = zdy2(ss4,fcn);Ma25(k) = zdy2(ss5,fcn);
   end
%     
    M21(i) = mean(Ma21);M22(i) = mean(Ma22);M23(i) = mean(Ma23);
%     M24(i) = mean(Ma24);M25(i) = mean(Ma25);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
end

plot(M21,'-*')
hold on
plot(M22,'-^')
plot(M23,'-s')
% plot(M24,'-d')
% plot(M25,'-p')
xlabel('snr');ylabel('�׶Գ�P');
grid
legend('amdsb','amssb','wbfm',0);
%�������о���
%line([0 30],[2.7 2.7],'color','k')
%line([0 30],[0.195 0.195],'color','r')


%% �о����rmaxȡ2.7