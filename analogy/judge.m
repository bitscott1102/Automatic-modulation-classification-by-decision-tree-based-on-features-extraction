function result = judge( y,N,fc,fs )
%�������������������źŵĵ��Ʒ�ʽ�����о�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ֵ
%���������в��õĵ����ź��ز�Ƶ��FcΪ150kHz������Ƶ��Ϊ1200kHz,����ǰ�ź�x��ȥ��ֱ������Ϊ1
%t_rmax = 3.6; t_dp = 0.3;t1_p = 0.1;t2_p = 0.35;
t_rmax = 14.185; t_dp = 0.7175;t1_p = 0.1;t2_p = 0.35;
14.185
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% ��ȡ��������
rmax = zdy3(y,N);%�����Ĺ�һ��˲ʱ����֮���ܶȵ����ֵ
phase = zdy4(y,N);%��ȡ��λ
b = zdy5(y,N);
ap = zdy(b,phase);%�����ķ����źŶ�˲ʱ��λ�����Է�������ֵ�ı�׼ƫ��
dp = zdy1(y);%��ȡ�����ķ����źŶ�˲ʱ��λ�����Է�������ֵ�ı�׼ƫ��
fcn=fc*N/fs-1;
p = zdy2(y,fcn);
a_p = abs(p);

%% �����о�
if rmax<t_rmax
   if p<=0.2
       if a_p<=t2_p
           result = 1;%�����жϽ��ΪFM�ź�
       else
           result = 4;%�����жϽ��ΪUSB�ź�
       end
   else
       result = 3;%�����жϽ��ΪLSB�ź�
   end
else
    if dp<=t_dp
    result = 0;%�����жϽ��ΪAM�ź�
    else 
        if p<=t1_p
            result = 2;%�����жϽ��ΪDSB�ź�
        else 
            result = 5;%�����жϽ��ΪVSB�ź�
        end
    end
end
        
  
    
end 



