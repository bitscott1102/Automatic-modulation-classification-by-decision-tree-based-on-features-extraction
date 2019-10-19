function thelta0=fai0_func(h,fs,fc)
Ns=length(h);a(1)=0;
fai0=angle(h);faid=diff([0,fai0]);
for i=2:Ns
    if faid(i)>pi
        a(i)=a(i-1)-2*pi;        
    elseif faid(i)<-pi
        a(i)=a(i-1)+2*pi;
    else
        a(i)=a(i-1);
    end
    fai(i)=fai0(i)+a(i);
end
k=1:Ns;fai0=2*pi*(k-1)*fc/fs;
thelta=fai-fai0;thelta=mod(thelta,2*pi);thelta=mod(thelta,1.9*pi);
h=[1/4,1/4,1/4,1/4];thelta=filter(h,1,thelta);
thelta0=thelta/mean(thelta)-1;