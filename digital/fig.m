clear;
for k=1:10
    y1(k)=Rat_ask2(fs,fc,k,N_in);y2(k)=Rat_ask4(s_ask4,fs,fc,k,N_in);    
    y3(k)=Rat_qam16(fs,fc,k,N_in);y4(k)=Rat_fsk2(s_fsk2,fs,fc,k,N_in);
    y5(k)=Rat_fsk4(s_fsk4,fs,fc,k,N_in);y6(k)=Rat_psk2(s_psk2,fs,fc,k,N_in);    
    y7(k)=Rat_psk4(s_psk4,fs,fc,k,N_in);y8(k)=Rat_psk8(s_psk8,fs,fc,k,N_in);
end
plot(y1,'-*');hold on; plot(y2,'-^');plot(y3,'-s');plot(y1,'-d');
plot(y1,'-p');plot(y1,'-v');plot(y1,'-x');plot(y1,'-o');
grid;