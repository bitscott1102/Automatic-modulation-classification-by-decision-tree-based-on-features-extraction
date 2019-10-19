%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function[s] =fsk8(d,fb,f1,f2,f3,f4,f5,f6,f7,f8,fs,Ac)
%clear;d=randint(1,8,4);fb=500;f1=500;f2=1000;f3=1500;f4=2000;Ac=1;fs=12000;
N=length(d);M=fs/fb;N1=fs/f1;N2=fs/f2;N3=fs/f3;N4=fs/f4;
N5=fs/f5;N6=fs/f6;N7=fs/f7;N8=fs/f8;
for j = 1:N
	if d(j)==0
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N1);
       end
    elseif d(j)==1
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N2);
       end
    elseif d(j)==2 
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N3);
       end
    elseif d(j)==3
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N4);
       end
    elseif d(j)==4
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N5);
       end
    elseif d(j)==5
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N6);
       end
    elseif d(j)==6 
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N7);
       end
	else
	   for i = 1:M
		s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/N8);
	   end
	end
end