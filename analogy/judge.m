function result = judge( y,N,fc,fs )
%利用三个参数对输入信号的调制方式进行判决
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%门限值
%仿真试验中采用的调制信号载波频率Fc为150kHz，采样频率为1200kHz,调制前信号x减去的直流分量为1
%t_rmax = 3.6; t_dp = 0.3;t1_p = 0.1;t2_p = 0.35;
t_rmax = 14.185; t_dp = 0.7175;t1_p = 0.1;t2_p = 0.35;
14.185
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 提取特征参量
rmax = zdy3(y,N);%零中心归一化瞬时幅度之谱密度的最大值
phase = zdy4(y,N);%提取相位
b = zdy5(y,N);
ap = zdy(b,phase);%零中心非弱信号段瞬时相位非线性分量绝对值的标准偏差
dp = zdy1(y);%提取零中心非弱信号段瞬时相位非线性分量绝对值的标准偏差
fcn=fc*N/fs-1;
p = zdy2(y,fcn);
a_p = abs(p);

%% 进入判决
if rmax<t_rmax
   if p<=0.2
       if a_p<=t2_p
           result = 1;%代表判断结果为FM信号
       else
           result = 4;%代表判断结果为USB信号
       end
   else
       result = 3;%代表判断结果为LSB信号
   end
else
    if dp<=t_dp
    result = 0;%代表判断结果为AM信号
    else 
        if p<=t1_p
            result = 2;%代表判断结果为DSB信号
        else 
            result = 5;%代表判断结果为VSB信号
        end
    end
end
        
  
    
end 



