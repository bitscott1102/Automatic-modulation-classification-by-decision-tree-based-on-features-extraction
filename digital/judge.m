function result=judge(s,fs,fc)
%�������������������źŵĵ��Ʒ�ʽ�����о�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%����ֵ
t_m11=0.301;t_m12=0.2345;t_m2=0.306;t_mf1=0.21015;
t_mf2=0.4226;t_mp1=0.43505;t_mp2=0.3870;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

h=hilbert(s);
a1=A_func(h);
M1=M_func(a1);
if M1>=t_m11
    a2=A_func(a1);M2=M_func(a2);
    if M2>=t_m2
        result=2; %����4ASK�ź�
    else
        result=1; %����2ASK�ź�
    end
elseif M1>=t_m12
    result=3; %����16QAM�ź�
else
    f=dif(h,fs);Mf1=M_func(A_func(f));
    if Mf1>=t_mf1
        f0=f0_func(f);Mf2=M_func(A_func(f0));
        if Mf2>=t_mf2
            result=5; %����4FSK�ź�
        else
            result=4; %����2FSK�ź�
        end
    else
        fai=fai0_func(h,fs,fc);
        p1=A_func(fai);Mp1=M_func(p1);
        if Mp1>=t_mp1
            Mp2=M_func(A_func(p1));
            if Mp2>=t_mp2
                result=8; %����8PSK�ź�
            else
                result=7; %����4PSK�ź�
            end
        else
            result=6; %����2PSK�ź�
        end
    end
end