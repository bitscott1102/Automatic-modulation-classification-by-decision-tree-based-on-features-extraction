function [y3] = dsb( x,xc,xs )
%xc=cos(2*pi*fc*t);xs=sin(2*pi*fc*t);
%x=cos(2*pi*n*2000/fs)+1.5*cos(2*pi*n*10000/fs);  
%fc=3e4;fs=1e5;
%²úÉúDSBÐÅºÅ

I3=2*x;
Q3=0;
y3=I3.*xc+Q3.*xs;
end

