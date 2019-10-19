% 模拟五种信号的识别：FM,LSB,USB,DSB,AM
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
d_in = randi([0,4],1,Ns); %随机产生0-5的数字，表示6种调制信号

%对调制信号进行积分，此处是模仿mode_identify的代码，还未完全理解
xx=fs/(2*pi*2000)*sin(2*pi*2000*n/fs)+1.5*fs/(2*pi*10000)*sin(2*pi*10000*n/fs); 
kf=(fc/fs)*2*pi/max(max(abs(x)));%kf为调频灵敏度

for k = 1:16
    k  %信噪比设置从1到15

    %%重置参数in表示生成的是某一信号，out表示判断结果是这一信号。用in和out的关系，表示判决是否正确
    N_am_in = 0; N_fm_in = 0; N_dsb_in = 0; N_lsb_in = 0; N_usb_in = 0; N_vsb_in = 0; 
    N_am_out = 0; N_fm_out = 0; N_dsb_out = 0; N_lsb_out = 0; N_usb_out = 0; N_vsb_out = 0;
%% 进入判决
    for i = 1:Ns;
      i
    %%选择模拟调制信号
    if d_in(i) == 0 %表示要生成AM信号
            y = am( x,xc,xs,fc,fs ); y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
            N_am_in = N_am_in+1; t = judge( y,N,fc,fs ); %如果判决结果是am，那么t = judge =1;
            if t == 0;      %表示判决准确
                N_am_out = N_am_out+1; 
            end
            
    elseif d_in(i) == 1 %表示要生成fm信号       
             y = fm( xx,kf,xc,xs ); y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
            N_fm_in = N_fm_in+1; t = judge( y,N,fc,fs ); %如果判决结果是fm，那么t = judge =1;
            if t == 1;      %表示判决准确
                N_fm_out = N_fm_out+1; 
            else
              rmax = zdy3(y,N);
              fcn=fc*N/fs-1;
                p = zdy2(y,fcn);
                a_p = abs(p);
            end
            
    elseif d_in(i) == 2 %表示要生成dsb信号       
             y = dsb( x,xc,xs ); y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
            N_dsb_in = N_dsb_in+1; 
            t = judge( y,N,fc,fs ); %如果判决结果是dsb，那么t = judge =1;
            if t == 2;      %表示判决准确
                N_dsb_out = N_dsb_out+1; 
            end            
   
    elseif d_in(i) == 3 %表示要生成lsb信号       
             y = lsb( x,xc,xs );
             y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
            N_lsb_in = N_lsb_in+1; 
            t = judge( y,N,fc,fs ); %如果判决结果是lsb，那么t = judge =1;
            if t == 3;      %表示判决准确
                N_lsb_out = N_lsb_out+1; 

            end  
   
    elseif d_in(i) == 4 %表示要生成usb信号       
             y = usb( x,xc,xs ); y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
            N_usb_in = N_usb_in+1; t = judge( y,N,fc,fs ); %如果判决结果是usb，那么t = judge =1;
            if t == 4;      %表示判决准确
                N_usb_out = N_usb_out+1; 
            end  
            
    % vsb 函数还没有写出来
    %elseif d_in(i) == 5 %表示要生成vsb信号       
    %         y = vsb( x,xc,xs ); y = awgn(y,k,'measured'); %y 表示产生的信号，注意与模仿代码中的s相区分
    %        N_vsb_in = N_vsb_in+1; t = judge( y,N,fc,fs ); %如果判决结果是vsb，那么t = judge =1;
    %        if t == 5;      %表示判决准确
    %            N_vsb_out = N_vsb_out+1; 
    %        end  
     end
end


%% 用in和out的关系，表示判决是否正确
y_am(k) = N_am_out/N_am_in; 
y_fm(k) = N_fm_out/N_fm_in;
y_dsb(k) = N_dsb_out/N_dsb_in; 
y_lsb(k) = N_lsb_out/N_lsb_in; 
y_usb(k) = N_usb_out/N_usb_in; 
y_vsb(k) = N_vsb_out/N_vsb_in; 

end

%% 画出信噪比和识别成功率的关系
plot(y_am,'-*','linewidth',1);   hold on;   grid on;     plot(y_fm,'-^','linewidth',1); 
plot(y_dsb,'-s','linewidth',1); plot(y_lsb,'-d','linewidth',1);  plot(y_usb,'-p','linewidth',1); 
plot(y_vsb,'-v','linewidth',1);  
legend('am','fm','dsb','lsb','usb',0)
 
xlabel('SNR(dB)'); ylabel('Probablity of Correct Classification'); 
title('Analog Signal Automatic Modulation Classification');

