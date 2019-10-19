clear;close;fb=500;fc=2000;fs=12000;Ac=1;

load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_4pam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_8psk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_16qam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_64qam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_bpsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_cpfsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_gfsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_qpsk_20.mat');

for i=1:20
    i
    for k=1:100
      
       % s3=psk2(d2,fb,fc,fs,Ac);s5=psk8(d8,fb,fc,fs,Ac);
       % ss3=awgn(s3,i,'measured');ss5=awgn(s5,i,'measured');
       
       ss3 = data_bpsk_20(10,:,i);
       ss5 = data_8psk_20(10,:,i);
       
       Map13(k)=Mp1_func(ss3,fs,fc);Map15(k)=Mp1_func(ss5,fs,fc);
    end
    Mp13(i)=mean(Map13);Mp15(i)=mean(Map15);

end
plot((2:2:20),Mp13(2:2:20),'-*','linewidth',2)
hold on
plot((2:2:20),Mp15(2:2:20),'-s','linewidth',2)
xlabel('SNR(dB)');ylabel('零中心归一化瞬时相位绝对值的平均值Mp1','FontWeight','bold');
grid
legend('2psk','8psk',0);
grid on
title('传统算法提取数据集信号的特征','FontWeight','bold');