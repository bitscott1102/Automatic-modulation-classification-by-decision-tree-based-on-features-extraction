clear all

load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_analog\data_amdsb_20.mat')
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_analog\data_amssb_20.mat')
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_analog\data_wbfm_20.mat')

close all
clc


for i  =  1:20;
    i
        for k = 1:100 %该循环产生在相同信噪比下的调制信号组
       k;
       
     %% 产生信号
    
%     s1 = am( x,xc,xs,fc,fs );s2 = fm( xx,kf,xc,xs );s3 = dsb( x,xc,xs );
%     s4 = lsb( x,xc,xs );s5 = usb( x,xc,xs );    %各种调制信号的生成
%     
%     ss1 = awgn(s1,i,'measured');ss2 = awgn(s2,i,'measured');
%     ss3 = awgn(s3,i,'measured');ss4 = awgn(s4,i,'measured');
%     ss5 = awgn(s5,i,'measured');    %awgn 加性高斯白噪声(Additive White Gaussian Noise)，i表示信噪比的大小；'measured'：函数将在加入噪声之前测定信号强度。
    ss1 = data_amdsb_20(10,:,i);
    ss2 = data_amssb_20(10,:,i);
    ss3 = data_wbfm_20(10,:,i);
    N = 128;
    
    
    b1 = zdy5(ss1,N);b2 = zdy5(ss2,N);b3 = zdy5(ss3,N);
    phase1 = zdy4(ss1,N);phase2 = zdy4(ss2,N);phase3 = zdy4(ss3,N);
    
    Ma41(k) = zdy1(b1,phase1);
    Ma42(k) = zdy1(b2,phase2);Ma43(k) = zdy1(b3,phase3);
    
%     b1 = zdy5(ss1,N);b2 = zdy5(ss2,N);b3 = zdy5(ss3,N);
%     b4 = zdy5(ss4,N);b5 = zdy5(ss5,N);
%     
%     phase1 = zdy4(ss1,N);phase2 = zdy4(ss2,N);phase3 = zdy4(ss3,N);
%     phase4 = zdy4(ss4,N);phase5 = zdy4(ss5,N);
%     
%     Ma41(k) = zdy1(b1,phase1);
%     Ma42(k) = zdy1(b2,phase2);Ma43(k) = zdy1(b3,phase3);
%     Ma44(k) = zdy1(b4,phase4);Ma45(k) = zdy1(b5,phase5);
   end
    
   M41(i) = mean(Ma41);M42(i) = mean(Ma42);M43(i) = mean(Ma43);
   
   %M44(i) = mean(Ma44);M45(i) = mean(Ma45);%取平均值，使得一个信噪比对应一个值
end


plot(M41,'-*')
hold on
plot(M42,'-^')
plot(M43,'-s')
xlabel('snr');ylabel('零中心非弱信号段瞬时相位非线性分量绝对值的标准偏差sigma_d_p');
grid
legend('amdsb','amssb','wbfm',0);
%画两条判决线
%line([0 30],[1.82 1.82],'color','r')
%line([0 30],[0.195 0.195],'color','r')


%% 判决结果rmax取2.7