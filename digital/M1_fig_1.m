
clear all;
close all;
fb  =  500;  fc  =  2000;   fs  =  12000; Ac  =  1; f1  =  500;    f2  =  1000; f3  =  1500;  f4  =  2000;

load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_4pam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_8psk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_16qam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_64qam_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_bpsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_cpfsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_gfsk_20.mat');
load('F:\paul\课件\课件大四上\调制信号的识别\新建文件夹\1\data_digital\data_qpsk_20.mat');


for i  =  1:20
    i
   for k = 1:100 %该循环产生在相同信噪比下的调制信号组
       k;    
    ss3 = data_16qam_20(10,:,i);
    ss5 = data_8psk_20(10,:,i);
    
    Ma13(k) = M1_func(ss3);
    Ma15(k) = M1_func(ss5);
   end
    
    M13(i) = mean(Ma13);
    M15(i) = mean(Ma15);%取平均值，使得一个信噪比对应一个值
 
end

%%%%%%%%%%%%%,'linewidth',2%%%%%%%%%%%%%%
plot((2:2:20),M13(2:2:20),'-*','linewidth',2)
hold on
plot((2:2:20),M15(2:2:20),'-^','linewidth',2)

xlabel('SNR(dB)');ylabel('零中心归一化瞬时幅度绝对值的平均值M1','FontWeight','bold');%%%%%%%%%%%%%%%%%%%
title('传统算法提取数据集信号的特征','FontWeight','bold');


grid

%%%%%%%%%%%%%
legend('16qam','8psk','threshold1',0);
%%%%%%%%%%%%%%%%5

%画两条判决线
%line([0 30],[0.325 0.325],'color','k')
%line([0 30],[0.195 0.195],'color','r')