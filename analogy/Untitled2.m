clear all

load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amdsb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_amssb_20.mat')
load('F:\paul\�μ�\�μ�������\�����źŵ�ʶ��\�½��ļ���\1\data_analog\data_wbfm_20.mat')

close all
clc


for i  =  2:2:20;
    i
    i_1 = i./2+10;
   for k = 1:1000 %��ѭ����������ͬ������µĵ����ź���
       k;
       
     %% �����ź�
    
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
   
%    M11(i) = mean(Ma11);M12(i) = mean(Ma12);M13(i) = mean(Ma13);
%    M14(i) = mean(Ma14);M15(i) = mean(Ma15);%ȡƽ��ֵ��ʹ��һ������ȶ�Ӧһ��ֵ
end

plot(M11,'-*','linewidth',2)
hold on
plot(M12,'-^','linewidth',2)
plot(M13,'-s','linewidth',2)
grid on
legend('amdsb','amssb','wbfm',0);
title('��ͳ�㷨��ȡ���ݼ��źŵ�����','FontWeight','bold');

% plot(M11,'-*')
% hold on
% plot(M12,'-^')
% plot(M13,'-s')
% plot(M14,'-d')
% plot(M15,'-p')
xlabel('SNR(dB)');ylabel('�����Ĺ�һ��˲ʱ����֮���ܶȵ����ֵ\gamma max','FontWeight','bold');
% grid
% legend('am','fm','dsb','lsb','usb',0);

legend('amdsb','amssb','wbfm',0);


%�������о���
%line([0 30],[2.7 2.7],'color','k')
%line([0 30],[0.195 0.195],'color','r')
title('��ͳ�㷨��ȡ���ݼ��źŵ�����','FontWeight','bold');

%% �о����rmaxȡ2.7