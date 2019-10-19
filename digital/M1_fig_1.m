
clear all;
close all;
fb  =  500;  fc  =  2000;   fs  =  12000; Ac  =  1; f1  =  500;    f2  =  1000; f3  =  1500;  f4  =  2000;

load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_4pam_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_8psk_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_16qam_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_64qam_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_bpsk_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_cpfsk_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_gfsk_20.mat');
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_digital\data_qpsk_20.mat');


for i  =  1:20
    i
   for k = 1:100 %��ѭ����������ͬ������µĵ����ź���
       k;    
    ss3 = data_16qam_20(10,:,i);
    ss5 = data_8psk_20(10,:,i);
    
    Ma13(k) = M1_func(ss3);
    Ma15(k) = M1_func(ss5);
   end
    
    M13(i) = mean(Ma13);
    M15(i) = mean(Ma15);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
 
end

%%%%%%%%%%%%%,'linewidth',2%%%%%%%%%%%%%%
plot((2:2:20),M13(2:2:20),'-*','linewidth',2)
hold on
plot((2:2:20),M15(2:2:20),'-^','linewidth',2)

xlabel('SNR(dB)');ylabel('�����Ĺ�һ��˲ʱ���Ⱦ���ֵ��ƽ��ֵM1','FontWeight','bold');%%%%%%%%%%%%%%%%%%%
title('��ͳ�㷨��ȡ���ݼ��źŵ�����','FontWeight','bold');


grid

%%%%%%%%%%%%%
legend('16qam','8psk','threshold1',0);
%%%%%%%%%%%%%%%%5

%�������о���
%line([0 30],[0.325 0.325],'color','k')
%line([0 30],[0.195 0.195],'color','r')