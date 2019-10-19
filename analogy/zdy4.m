function phase=zdy4(y,N)
% z=hilbert(y);
z = y;
phase=[];
for i=1:N
    phase00=angle(z(i));
    phase00=unwrap(phase00);
    phase=[phase,phase00];
end



%% previous version
% function phase=zdy4(y,N)
% z=hilbert(y);
% phase=[];
% for i=1:N
%     phase00=angle(z(i));
%     phase00=unwrap(phase00);
%     phase=[phase,phase00];
% end
%
