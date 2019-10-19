function [y4] = lsb( x,xc,xs )
%xc=cos(2*pi*fc*t);xs=sin(2*pi*fc*t);
%x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);  
%fc=3e4;fs=1e5;
%产生lsb信号

I4=x;                                                          %LSB正交调制
Q4=imag(hilbert(x));
y4=I4.*xc+Q4.*xs;
end

