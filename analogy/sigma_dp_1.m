clear all

load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amdsb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amssb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_wbfm_20.mat')

close all
clc


for i  =  1:20;
    i
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
   
   %M44(i) = mean(Ma44);M45(i) = mean(Ma45);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
end


plot(M41,'-*')
hold on
plot(M42,'-^')
plot(M43,'-s')
xlabel('snr');ylabel('�����ķ����źŶ�˲ʱ��λ�����Է�������ֵ�ı�׼ƫ��sigma_d_p');
grid
legend('amdsb','amssb','wbfm',0);
%�������о���
%line([0 30],[1.82 1.82],'color','r')
%line([0 30],[0.195 0.195],'color','r')


%% �о����rmaxȡ2.7