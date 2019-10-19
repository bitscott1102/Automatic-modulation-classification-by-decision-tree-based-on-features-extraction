clear; 
close;
fb = 500; fc = 2000; fs = 12000; Ac = 1; f1 = 500; f2 = 1000; f3 = 1500; f4 = 2000; 
Ns = 5000; d_in = randi([0,7],1,Ns); %随机产生0-7的数字，表示8中调制信号

for k = 1:16
    k


    N_2ask_in = 0; N_4ask_in = 0; N_2fsk_in = 0; N_2psk_in = 0; 
    N_4fsk_in = 0; N_4psk_in = 0; N_8psk_in = 0; N_16qam_in = 0; 
    N_2ask_out = 0; N_4ask_out = 0; N_2fsk_out = 0; N_2psk_out = 0; 
    N_4fsk_out = 0; N_4psk_out = 0; N_8psk_out = 0; N_16qam_out = 0; %重置参数in表示生成的是某一信号，out表示判断结果是这一信号。用in和out的关系，表示判决是否正确

%% 进入判决    
  for i = 1:Ns
      i; 
    if d_in(i) == 0         %表示2ask
            d = randi([0,1],1,300); s = ask2(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); %生成2ask信号
            N_2ask_in = N_2ask_in+1; t = judge(s,fs,fc); %如果判决结果是2ask，那么t = judge =1;
            if t == 1;      %表示判决准确
                N_2ask_out = N_2ask_out+1; 
            end
    elseif d_in(i) == 1     %表示4ask
        d = randi([0,3],1,300); s = ask4(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_4ask_in = N_4ask_in+1; t = judge(s,fs,fc); 
        if t == 2; 
            N_4ask_out = N_4ask_out+1; 
        end
    elseif d_in(i) == 2     %表示16qam
        d = randi([0,15],1,300); s = qam16(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_16qam_in = N_16qam_in+1; t = judge(s,fs,fc); 
        if t == 3; 
            N_16qam_out = N_16qam_out+1; 
        end
    elseif d_in(i) == 3     %表示2fsk
        d = randi([0,1],1,300); s = fsk2(d,fb,f1,f4,fs,Ac); s = awgn(s,k,'measured'); 
        N_2fsk_in = N_2fsk_in+1; t = judge(s,fs,fc); 
        if t == 4; 
            N_2fsk_out = N_2fsk_out+1; 
        end
    elseif d_in(i) == 4     %表示4fsk
        d = randi([0,3],1,300); s = fsk4(d,fb,f1,f2,f3,f4,fs,Ac); s = awgn(s,k,'measured'); 
        N_4fsk_in = N_4fsk_in+1; t = judge(s,fs,fc); 
        if t == 5; 
            N_4fsk_out = N_4fsk_out+1; 
        end
    elseif d_in(i) == 5     %表示2psk
        d = randi([0,1],1,300); s = psk2(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_2psk_in = N_2psk_in+1; t = judge(s,fs,fc); 
        if t == 6; 
            N_2psk_out = N_2psk_out+1; 
        end
    elseif d_in(i) == 6     %表示4psk
        d = randi([0,3],1,300); s = psk4(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_4psk_in = N_4psk_in+1; t = judge(s,fs,fc); 
        if t == 7; 
            N_4psk_out = N_4psk_out+1; 
        end
    else                    %表示8psk
        d = randi([0,7],1,300); s = psk8(d,fb,fc,fs,Ac); s = awgn(s,k,'measured'); 
        N_8psk_in = N_8psk_in+1; t = judge(s,fs,fc); 
        if t == 8; 
            N_8psk_out = N_8psk_out+1; 
        end
    end
  end
  
%% 用in和out的关系，表示判决是否正确
y_2ask(k) = N_2ask_out/N_2ask_in; 
y_4ask(k) = N_4ask_out/N_4ask_in;
y_2fsk(k) = N_2fsk_out/N_2fsk_in; 
y_4fsk(k) = N_4fsk_out/N_4fsk_in; 
y_2psk(k) = N_2psk_out/N_2psk_in; 
y_4psk(k) = N_4psk_out/N_4psk_in; 
y_16qam(k) = N_16qam_out/N_16qam_in; 
y_8psk(k) = N_8psk_out/N_8psk_in;



end

%% 画出信噪比和识别成功率的关系
plot(y_2ask,'-*','linewidth',1);   hold on;   grid;     plot(y_4ask,'-^','linewidth',1); 
plot(y_16qam,'-s','linewidth',1); plot(y_2fsk,'-d','linewidth',1);  plot(y_4fsk,'-p','linewidth',1); 
plot(y_2psk,'-v','linewidth',1);  plot(y_4psk,'-x','linewidth',1);  plot(y_8psk,'-o','linewidth',1); 
xlabel('SNR(dB)'); ylabel('Probablity of Correct Classification'); 
legend('2ask','4ask','16qam','2fsk','4fsk','2psk','4psk','8psk',0)

title('Digital Signal Automatic Modulation Classification');
