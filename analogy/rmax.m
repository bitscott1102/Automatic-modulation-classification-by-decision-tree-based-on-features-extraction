clear all
close all
clc
fc=10000;                                     %�ز�Ƶ��FcΪ150khz
fs=40000;                                    %�źŲ�����12000khz
n=1:100; 
x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs); %�����ź�
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
Ns = 1000;%����1000��ʵ�飬����1000�εĵ����ź�
%�Ե����źŽ��л��֣��˴���ģ��mode_identify�Ĵ��룬��δ��ȫ���
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs);

kf=(fc/fs)*2*pi/max(max(abs(x)));%kfΪ��Ƶ������

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
    
    Ma11(k) = zdy3(ss1,N);Ma12(k) = zdy3(ss2,N);Ma13(k) = zdy3(ss3,N);
    Ma14(k) = zdy3(ss4,N);
    Ma15(k) = zdy3(ss5,N);
   end
    
   M11(i) = mean(Ma11);M12(i) = mean(Ma12);M13(i) = mean(Ma13);
   M14(i) = mean(Ma14);M15(i) = mean(Ma15);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
   thr(i) = 14.185;
end

plot(M11,'-*','linewidth',2)
hold on
plot(M12,'-^','linewidth',2)
plot(M13,'-s','linewidth',2)
plot(M14,'-d','linewidth',2)
plot(M15,'-p','linewidth',2)
plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('�����Ĺ�һ��˲ʱ����֮���ܶȵ����ֵ\gamma max','FontWeight','bold');
grid
legend('am','fm','dsb','lsb','usb','threshold',0);


%% �о����rmaxȡ14.185