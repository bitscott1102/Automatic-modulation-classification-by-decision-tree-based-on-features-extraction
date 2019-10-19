function P = zdy2(y,fcn)
PL = 0;PU = 0;
t = fft(y);
for i = 1:fcn
    PL = PL+abs(t(i))*abs(t(i));
    PU = PU+abs(t(fcn+1+i))*abs(t(fcn+1+i));
end
P1 = (PL-PU)/(PU+PL);
P = P1;
