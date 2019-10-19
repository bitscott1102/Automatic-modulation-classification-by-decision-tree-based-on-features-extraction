function ap = zdy(b,phase)
phase_mean = mean(phase);
phase_nl = phase-phase_mean;
amp_mean = mean(abs(b));
amp_n = abs(b)/amp_mean;
nCount = 0;nl1 = 0;nl2 = 0;
for j = 1:length(b)
    if amp_n(j)>0.6
       nCount = nCount+1;
       nl1 = nl1+(phase_nl(j))*(phase_nl(j));
       nl2 = nl2+abs(phase_nl(j));
    else phase_nl(j) = 0;
    end
end
ap = sqrt(nl1/nCount-(nl2/nCount)*(nl2/nCount));
