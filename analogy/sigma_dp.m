%%
clear;close;
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
%%

for i=1:30
    i
    for k=1:100
    s1 = am( x,xc,xs,fc,fs );s3 = dsb( x,xc,xs );%���ֵ����źŵ�����
    
    ss1 = awgn(s1,i,'measured');
    ss3 = awgn(s3,i,'measured');   %awgn ���Ը�˹������(Additive White Gaussian Noise)��i��ʾ����ȵĴ�С��'measured'���������ڼ�������֮ǰ�ⶨ�ź�ǿ�ȡ�
       
       Map11(k)=Mp1_func(ss1,fs,fc);Map13(k)=Mp1_func(ss3,fs,fc);
    end
    Mp11(i)=1-mean(Map11);Mp13(i)=1-mean(Map13);
    thr(i) = 0.7175;
end
plot(Mp11,'-*','linewidth',2)
hold on
plot(Mp13,'-^','linewidth',2)

plot(thr,'--','color','k','linewidth',2);
xlabel('SNR(dB)');ylabel('�����ķ����źŶ�˲ʱ��λ�����Է����ı�׼ƫ��\sigma_d_p','FontWeight','bold');
grid
legend('am','dsb','threshold',0);
%line([0 30],[0.395 0.395],'color','k')
grid on
