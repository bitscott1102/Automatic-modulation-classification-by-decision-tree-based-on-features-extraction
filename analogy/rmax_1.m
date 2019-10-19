clear all

load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amdsb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amssb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_wbfm_20.mat')

close all
clc


for i  =  1:20;
    i
   for k = 1:1000 %��ѭ����������ͬ������µĵ����ź���
       k;
       
 %% �����ź�����ȡ����
    
    ss1 = data_amdsb_20(10,:,i);
    ss2 = data_amssb_20(10,:,i);
    ss3 = data_wbfm_20(10,:,i);
    N = 128;
    Ma11(k) = zdy3(ss1,N);
    Ma12(k) = zdy3(ss2,N);
    Ma13(k) = zdy3(ss3,N);
    
    
    
   end
    
   M11(i) = mean(Ma11);
   M12(i) = mean(Ma12);
   M13(i) = mean(Ma13);
   
end

plot((2:2:20),M11(2:2:20),'-*','linewidth',2)
hold on
plot((2:2:20),M12(2:2:20),'-^','linewidth',2)
plot((2:2:20),M13(2:2:20),'-s','linewidth',2)
grid on
legend('amdsb','amssb','wbfm',0);
title('��ͳ�㷨��ȡ���ݼ��źŵ�����','FontWeight','bold');



xlabel('SNR(dB)');ylabel('�����Ĺ�һ��˲ʱ����֮���ܶȵ����ֵ\gamma max','FontWeight','bold');

legend('amdsb','amssb','wbfm',0);


title('��ͳ�㷨��ȡ���ݼ��źŵ�����','FontWeight','bold');
