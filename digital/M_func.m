function M=M_func(s)    
h = [1/5,1/5,1/5,1/5,1/5];
s = filter(h,1,s);    %��Ҫ��ȥ��Ĺ��ܣ���������ܲ�һ����
M = mean(abs(s));

