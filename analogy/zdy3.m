function [rmax,b] = zdy3(y,N)
% acn0 = hilbert(y);
b = [];
for i  =  1:N
    a = abs(y(i));
    b = [b,a];
end
ma = mean(b);
for i = 1:N
    acn = b/ma-1;
end
middle = abs(fft(acn));
r = middle.*middle/N;
rmax = max(r);

%% previous version 
% function [rmax,b] = zdy3(y,N)
% acn0 = hilbert(y);
% b = [];
% for i = 1:N
% a = sqrt(real(acn0(i))*real(acn0(i))+imag(acn0(i))*imag(acn0(i)));
% b = [b,a];
% end
% ma = mean(b);
% for i = 1:N
% acn = b/ma-1;
% end
% middle = abs(fft(acn));
% r = middle.*middle/N;
% rmax = max(r);
% 
