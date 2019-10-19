clear all
close all
clc
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

for i  =  1:30
    i
   for k = 1:100 %��ѭ����������ͬ������µĵ����ź���
       k;
       
     %% �����ź�
    
    s1 = am( x,xc,xs,fc,fs );s2 = fm( xx,kf,xc,xs );s3 = dsb( x,xc,xs );
    s4 = lsb( x,xc,xs );s5 = usb( x,xc,xs );    %���ֵ����źŵ�����
    
    ss1 = awgn(s1,i,'measured');ss2 = awgn(s2,i,'measured');
    ss3 = awgn(s3,i,'measured');ss4 = awgn(s4,i,'measured');
    ss5 = awgn(s5,i,'measured');    %awgn ���Ը�˹������(Additive White Gaussian Noise)��i��ʾ����ȵĴ�С��'measured'���������ڼ�������֮ǰ�ⶨ�ź�ǿ�ȡ�
    
    Ma21(k) = zdy2(ss1,fcn);Ma22(k) = zdy2(ss2,fcn);Ma23(k) = zdy2(ss3,fcn);
    Ma24(k) = zdy2(ss4,fcn);Ma25(k) = zdy2(ss5,fcn);
   end
    
   M21(i) = mean(Ma21);M22(i) = mean(Ma22);M23(i) = mean(Ma23);
   M24(i) = mean(Ma24);M25(i) = mean(Ma25);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
   thr(i) = 0.1;
end

plot(M21,'-*','linewidth',2)
hold on
plot(M22,'-^','linewidth',2)
plot(M23,'-s','linewidth',2)
plot(M24,'-d','linewidth',2)
plot(M25,'-p','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('�׶Գ���P','FontWeight','bold');
grid on
legend('am','fm','dsb','lsb','usb','threshold',0);
%�������о���
%line([0 30],[2.7 2.7],'color','k')
%line([0 30],[0.195 0.195],'color','r')


%% �о����rmaxȡ2.7