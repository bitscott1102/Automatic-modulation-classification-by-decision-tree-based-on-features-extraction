clear; 
close;
fb = 500; fc = 2000; fs = 12000; Ac = 1; f1 = 500; f2 = 1000; f3 = 1500; f4 = 2000; 
Ns = 5000; d_in = randi([0,7],1,Ns); %�������0-7�����֣���ʾ8�е����ź�

for k = 1:16
    k


    N_2ask_in = 0; N_4ask_in = 0; N_2fsk_in = 0; N_2psk_in = 0; 
    N_4fsk_in = 0; N_4psk_in = 0; N_8psk_in = 0; N_16qam_in = 0; 
    N_2ask_out = 0; N_4ask_out = 0; N_2fsk_out = 0; N_2psk_out = 0; 
    N_4fsk_out = 0; N_4psk_out = 0; N_8psk_out = 0; N_16qam_out = 0; %���ò���in��ʾ���ɵ���ĳһ�źţ�out��ʾ�жϽ������һ�źš���in��out�Ĺ�ϵ����ʾ�о��Ƿ���ȷ

%% �����о�    
  for i = 1:Ns
      i; 
    if d_in(i) == 0         %��ʾ2ask
            d = randi([0,1],1,300); s = ask2(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); %����2ask�ź�
            N_2ask_in = N_2ask_in+1; t = judge(s,fs,fc); %����о������2ask����ôt = judge =1;
            if t == 1;      %��ʾ�о�׼ȷ
                N_2ask_out = N_2ask_out+1; 
            end
    elseif d_in(i) == 1     %��ʾ4ask
        d = randi([0,3],1,300); s = ask4(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_4ask_in = N_4ask_in+1; t = judge(s,fs,fc); 
        if t == 2; 
            N_4ask_out = N_4ask_out+1; 
        end
    elseif d_in(i) == 2     %��ʾ16qam
        d = randi([0,15],1,300); s = qam16(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_16qam_in = N_16qam_in+1; t = judge(s,fs,fc); 
        if t == 3; 
            N_16qam_out = N_16qam_out+1; 
        end
    elseif d_in(i) == 3     %��ʾ2fsk
        d = randi([0,1],1,300); s = fsk2(d,fb,f1,f4,fs,Ac); s = awgn(s,k,'measured'); 
        N_2fsk_in = N_2fsk_in+1; t = judge(s,fs,fc); 
        if t == 4; 
            N_2fsk_out = N_2fsk_out+1; 
        end
    elseif d_in(i) == 4     %��ʾ4fsk
        d = randi([0,3],1,300); s = fsk4(d,fb,f1,f2,f3,f4,fs,Ac); s = awgn(s,k,'measured'); 
        N_4fsk_in = N_4fsk_in+1; t = judge(s,fs,fc); 
        if t == 5; 
            N_4fsk_out = N_4fsk_out+1; 
        end
    elseif d_in(i) == 5     %��ʾ2psk
        d = randi([0,1],1,300); s = psk2(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_2psk_in = N_2psk_in+1; t = judge(s,fs,fc); 
        if t == 6; 
            N_2psk_out = N_2psk_out+1; 
        end
    elseif d_in(i) == 6     %��ʾ4psk
        d = randi([0,3],1,300); s = psk4(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_4psk_in = N_4psk_in+1; t = judge(s,fs,fc); 
        if t == 7; 
            N_4psk_out = N_4psk_out+1; 
        end
    else                    %��ʾ8psk
        d = randi([0,7],1,300); s = psk8(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_8psk_in = N_8psk_in+1; t = judge(s,fs,fc); 
        if t == 8; 
            N_8psk_out = N_8psk_out+1; 
        end
    end
  end
  
%% ��in��out�Ĺ�ϵ����ʾ�о��Ƿ���ȷ
y_2ask(k) = N_2ask_out/N_2ask_in; 
y_4ask(k) = N_4ask_out/N_4ask_in;
y_2fsk(k) = N_2fsk_out/N_2fsk_in; 
y_4fsk(k) = N_4fsk_out/N_4fsk_in; 
y_2psk(k) = N_2psk_out/N_2psk_in; 
y_4psk(k) = N_4psk_out/N_4psk_in; 
y_16qam(k) = N_16qam_out/N_16qam_in; 
y_8psk(k) = N_8psk_out/N_8psk_in;



end

%% ��������Ⱥ�ʶ��ɹ��ʵĹ�ϵ
plot(y_2ask,'-*','linewidth',1);   hold on;   grid;     plot(y_4ask,'-^','linewidth',1); 
plot(y_16qam,'-s','linewidth',1); plot(y_2fsk,'-d','linewidth',1);  plot(y_4fsk,'-p','linewidth',1); 
plot(y_2psk,'-v','linewidth',1);  plot(y_4psk,'-x','linewidth',1);  plot(y_8psk,'-o','linewidth',1); 
xlabel('SNR(dB)'); ylabel('Probablity of Correct Classification'); 
legend('2ask','4ask','16qam','2fsk','4fsk','2psk','4psk','8psk',0)

title('Digital Signal Automatic Modulation Classification');
