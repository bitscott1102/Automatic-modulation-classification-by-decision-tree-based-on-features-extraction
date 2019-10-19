function b=zdy5(y,N)
t=[];
for i=1:N
a=abs(y(i));
t=[t,a];
end
ma=mean(t);
b=t/ma;

%% previous version 
% function b=zdy5(y,N)
% acn0=hilbert(y);
% t=[];
% for i=1:N
%     a=sqrt(real(acn0(i))*real(acn0(i))+imag(acn0(i))*imag(acn0(i)));
%     t=[t,a];
% end
% ma=mean(t);
% b=t/ma;