function [y2] = fm(xx,kf,xc,xs)
%xc=cos(2*pi*fc*t);xs=sin(2*pi*fc*t);
%x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);  
%fc=3e4;fs=1e5;
%²úÉúFMÐÅºÅ

I2=2*cos(kf*xx);  
Q2=-2*sin(kf*xx);
y2=I2.*xc+Q2.*xs;

end
