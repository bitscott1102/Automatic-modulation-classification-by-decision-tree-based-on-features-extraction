function[s] = psk8(d,fb,fc,fs,Ac)
%clear; d=randint(1,10,8);fb=500;fc=2000;Ac=1;fs=12000;
N=length(d);M=fs/fb;tb=1/fb;tc=1/fc;Nc=M*tc/tb;
for j = 1:N
	 if d(j)==0
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc);
	    end
     elseif d(j)==1
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc+pi/4);
	    end
     elseif d(j)==2
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc+pi/2);
	    end
     elseif d(j)==3
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc+3*pi/4);
	    end
     elseif d(j)==4
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc+pi);
	    end
     elseif d(j)==5
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc-3*pi/4);
	    end
     elseif d(j)==6
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc-pi/2);
	    end
     elseif d(j)==7
	    for i = 1:M
		 s((j-1)*M+i)=Ac*cos(2*pi*(i-1)/Nc-pi/4);
        end     
    end
end