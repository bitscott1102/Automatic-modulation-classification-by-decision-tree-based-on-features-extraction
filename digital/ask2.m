%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[s] = ask2(d,fb,fc,fs,Ac)   %AcӦ��Ϊ��ֵ
%clear;d=randint(1,10,2);fb=500;fc=2000;fs=12000;Ac=1;
N=length(d);M=fs/fb;tb=1/fb;tc=1/fc;Nc=M*tc/tb;
for j = 1:N
	for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc)*d(j);
    end
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%