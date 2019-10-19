function [ y ] = usb( x,xc,xs )
%xc=cos(2*pi*fc*t);xs=sin(2*pi*fc*t);
%x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);  
%fc=3e4;fs=1e5;
%²úÉúusbÐÅºÅ

I5=x;
Q5=-imag(hilbert(x));
y=I5.*xc+Q5.*xs;

end

