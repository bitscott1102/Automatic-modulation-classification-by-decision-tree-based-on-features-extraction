function [y] = am(x,xc,xs,fc,fs)
%xc=cos(2*pi*fc*t);xs=sin(2*pi*fc*t);
%x=cos(2*pi*n*2000/fs);  
%fc=3e4;fs=1e5; 
%AM正交调制
%产生AM信号

I1=2*(1+0.9*x);                                               
Q1=0;
y=I1.*xc+Q1.*xs;
end

