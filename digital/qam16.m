function[s] = qam16(d,fb,fc,fs,Ac)
%clear; d=randint(1,10,16);fb=500;fc=2000;Ac=1;fs=12000;
N=length(d);M=fs/fb;tb=1/fb;tc=1/fc;Nc=M*tc/tb;
for j = 1:N
	 if d(j)==0
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(18)*Ac*cos(2*pi*(i-1)/Nc+3*pi/4);
	    end
     elseif d(j)==1
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc+2.8198);
	    end
     elseif d(j)==2
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc-2.8198);
	    end
     elseif d(j)==3
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(18)*Ac*cos(2*pi*(i-1)/Nc-3*pi/4);
	    end
     elseif d(j)==4
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc+1.8925);
	    end
     elseif d(j)==5
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(2)*Ac*cos(2*pi*(i-1)/Nc+3*pi/4);
	    end
     elseif d(j)==6
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(2)*Ac*cos(2*pi*(i-1)/Nc-3*pi/4);
	    end
     elseif d(j)==7
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc-1.8925);
	    end
     elseif d(j)==8
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc+1.2490);
	    end
     elseif d(j)==9
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(2)*Ac*cos(2*pi*(i-1)/Nc+pi/4);
	    end
     elseif d(j)==10
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(2)*Ac*cos(2*pi*(i-1)/Nc-pi/4);
	    end
     elseif d(j)==11
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc-1.2490);
	    end
     elseif d(j)==12
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(18)*Ac*cos(2*pi*(i-1)/Nc+pi/4);
	    end
     elseif d(j)==13
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc+0.3218);
	    end
     elseif d(j)==14
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(10)*Ac*cos(2*pi*(i-1)/Nc-0.3218);
	    end
     else
	    for i = 1:M
		 s((j-1)*M+i)=sqrt(18)*Ac*cos(2*pi*(i-1)/Nc-pi/4);
	    end
    end
end