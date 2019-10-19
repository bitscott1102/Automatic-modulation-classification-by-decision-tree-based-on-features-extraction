function[s] = fsk2(d,fb,f1,f2,fs,Ac)
%clear;d=randint(1,10,2);fb=500;f1=500;f2=2000;Ac=1;fs=12000;
N=length(d);%N=size(d,2);%N = number of data bits.
M=fs/fb;%M = number of samples per bit duration.
tb=1/fb;tm=1/f1;ts=1/f2;
Nm=floor(M*tm/tb); %Nm = number of samples per mark period.
Ns=floor(M*ts/tb); %Ns = number of samples per space period.
for j = 1:N
	if d(j) == 1
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Ns);
	   end
	else
	   for i = 1:M
        s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nm);
	   end
	end
end