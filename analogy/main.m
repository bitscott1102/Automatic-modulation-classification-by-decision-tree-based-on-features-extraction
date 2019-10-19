% ģ�������źŵ�ʶ��FM,LSB,USB,DSB,AM
clear all
close all
clc
fc=10000;                                     %�ز�Ƶ��FcΪ150khz
fs=40000;                                    %�źŲ�����12000khz
n=1:100; 
x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);%�����ź�
len=length(x);
N=len;
t=0:1/fs:((len-1)/fs);
xc=cos(2*pi*fc*t);
xs=sin(2*pi*fc*t);
Ns = 1000;%����1000��ʵ�飬����1000�εĵ����ź�
d_in = randi([0,4],1,Ns); %�������0-5�����֣���ʾ6�ֵ����ź�

%�Ե����źŽ��л��֣��˴���ģ��mode_identify�Ĵ��룬��δ��ȫ���
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs); 
kf=(fc/fs)*2*pi/max(max(abs(x)));%kfΪ��Ƶ������

for k = 1:16
    k  %��������ô�1��15

    %%���ò���in��ʾ���ɵ���ĳһ�źţ�out��ʾ�жϽ������һ�źš���in��out�Ĺ�ϵ����ʾ�о��Ƿ���ȷ
    N_am_in = 0; N_fm_in = 0; N_dsb_in = 0; N_lsb_in = 0; N_usb_in = 0; N_vsb_in = 0; 
    N_am_out = 0; N_fm_out = 0; N_dsb_out = 0; N_lsb_out = 0; N_usb_out = 0; N_vsb_out = 0;
%% �����о�
    for i = 1:Ns;
      i
    %%ѡ��ģ������ź�
    if d_in(i) == 0 %��ʾҪ����AM�ź�
            y = am( x,xc,xs,fc,fs ); y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
            N_am_in = N_am_in+1; t = judge( y,N,fc,fs ); %����о������am����ôt = judge =1;
            if t == 0;      %��ʾ�о�׼ȷ
                N_am_out = N_am_out+1; 
            end
            
    elseif d_in(i) == 1 %��ʾҪ����fm�ź�       
             y = fm( xx,kf,xc,xs ); y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
            N_fm_in = N_fm_in+1; t = judge( y,N,fc,fs ); %����о������fm����ôt = judge =1;
            if t == 1;      %��ʾ�о�׼ȷ
                N_fm_out = N_fm_out+1; 
            else
              rmax = zdy3(y,N);
              fcn=fc*N/fs-1;
                p = zdy2(y,fcn);
                a_p = abs(p);
            end
            
    elseif d_in(i) == 2 %��ʾҪ����dsb�ź�       
             y = dsb( x,xc,xs ); y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
            N_dsb_in = N_dsb_in+1; 
            t = judge( y,N,fc,fs ); %����о������dsb����ôt = judge =1;
            if t == 2;      %��ʾ�о�׼ȷ
                N_dsb_out = N_dsb_out+1; 
            end            
   
    elseif d_in(i) == 3 %��ʾҪ����lsb�ź�       
             y = lsb( x,xc,xs );
             y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
            N_lsb_in = N_lsb_in+1; 
            t = judge( y,N,fc,fs ); %����о������lsb����ôt = judge =1;
            if t == 3;      %��ʾ�о�׼ȷ
                N_lsb_out = N_lsb_out+1; 

            end  
   
    elseif d_in(i) == 4 %��ʾҪ����usb�ź�       
             y = usb( x,xc,xs ); y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
            N_usb_in = N_usb_in+1; t = judge( y,N,fc,fs ); %����о������usb����ôt = judge =1;
            if t == 4;      %��ʾ�о�׼ȷ
                N_usb_out = N_usb_out+1; 
            end  
            
    % vsb ������û��д����
    %elseif d_in(i) == 5 %��ʾҪ����vsb�ź�       
    %         y = vsb( x,xc,xs ); y = awgn(y,k,'measured'); %y ��ʾ�������źţ�ע����ģ�´����е�s������
    %        N_vsb_in = N_vsb_in+1; t = judge( y,N,fc,fs ); %����о������vsb����ôt = judge =1;
    %        if t == 5;      %��ʾ�о�׼ȷ
    %            N_vsb_out = N_vsb_out+1; 
    %        end  
     end
end


%% ��in��out�Ĺ�ϵ����ʾ�о��Ƿ���ȷ
y_am(k) = N_am_out/N_am_in; 
y_fm(k) = N_fm_out/N_fm_in;
y_dsb(k) = N_dsb_out/N_dsb_in; 
y_lsb(k) = N_lsb_out/N_lsb_in; 
y_usb(k) = N_usb_out/N_usb_in; 
y_vsb(k) = N_vsb_out/N_vsb_in; 

end

%% ��������Ⱥ�ʶ��ɹ��ʵĹ�ϵ
plot(y_am,'-*','linewidth',1);   hold on;   grid on;     plot(y_fm,'-^','linewidth',1); 
plot(y_dsb,'-s','linewidth',1); plot(y_lsb,'-d','linewidth',1);  plot(y_usb,'-p','linewidth',1); 
plot(y_vsb,'-v','linewidth',1);  
legend('am','fm','dsb','lsb','usb',0)
 
xlabel('SNR(dB)'); ylabel('Probablity of Correct Classification'); 
title('Analog Signal Automatic Modulation Classification');

