function dp  =  zdy1(y)

fc = 10000;                                     %�ز�Ƶ��FcΪ150khz
fs = 40000;                                    %�źŲ�����12000khz
n = 1:100; 
x = cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs); %�����ź�
len = length(x);
N = len;
t = 0:1/fs:((len-1)/fs);
xc = cos(2*pi*fc*t);
xs = sin(2*pi*fc*t);
Ns  =  1000;%����1000��ʵ�飬����1000�εĵ����ź�

ss1  =  y;
for k = 1:100     
       Map11(k) = Mp1_func(ss1,fs,fc);
end
Mp11 = 1-mean(Map11);
dp = Mp11;
