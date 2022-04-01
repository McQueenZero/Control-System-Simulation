%% 系统描述模型练习
clc,clear,close all
%% 基本描述
G1=tf([1 1],[1 2 1])
G2=minreal(G1)
G3=zpk(G1)
G4=feedback(G1,G2)
G5=feedback(G1,G2,+1)
G6=tf([1 1],[1 2 1],0.01)
%% 模型转换
[A,B,C,D]=tf2ss(G1.num{1},G1.den{1})    %注意G1.num，G1.den为元胞数组的引用格式
W1=c2d(G1,0.1,'ZOH')
W2=c2d(G1,0.01,'ZOH')
W3=c2d(G1,0.1,'Tustin')
W4=c2d(G1,0.01,'Tustin')
%% 频域分析
figure('Name','系统G4的波特图','NumberTitle','off'),bode(G1*G2),grid on;
title('系统G4的波特图')
figure('Name','系统G4的幅值裕度和相角裕度','NumberTitle','off'),margin(G1*G2),grid on;
figure('Name','系统G4的奈奎斯特图','NumberTitle','off'),nyquist(G1*G2),grid on;
title('系统G4的奈奎斯特图')
figure('Name','系统G4的尼柯尔斯曲线','NumberTitle','off'),nichols(G1*G2),grid on;
title('系统G4的尼柯尔斯曲线')
figure('Name','系统G4的根轨迹曲线','NumberTitle','off'),rlocus(G1*G2),grid on;
title('系统G4的根轨迹曲线')
disp('系统G4的幅值裕度和相角裕度如下：')
[Gm,Pm,wcg,wc]=margin(G1*G2)
figure('Name','系统G5的波特图','NumberTitle','off'),bode(-G1*G2),grid on;
title('系统G5的波特图')
figure('Name','系统G5的幅值裕度和相角裕度','NumberTitle','off'),margin(-G1*G2),grid on;
figure('Name','系统G5的奈奎斯特图','NumberTitle','off'),nyquist(-G1*G2),grid on;
title('系统G5的奈奎斯特图')
figure('Name','系统G5的尼柯尔斯曲线','NumberTitle','off'),nichols(-G1*G2),grid on;
title('系统G5的尼柯尔斯曲线')
figure('Name','系统G5的根轨迹曲线','NumberTitle','off'),rlocus(-G1*G2),grid on;
title('系统G5的根轨迹曲线')
disp('系统G5的幅值裕度和相角裕度如下：')
[Gm,Pm,wcg,wc]=margin(-G1*G2)
%% 纯滞后环节传函
G7=tf([1 1],[1 2 1],'iodelay',1)
figure('Name','系统G1和G7的阶跃响应','NumberTitle','off')
step(G1), hold on;
step(G7), grid on;
legend({'G1','G7'},'Location','best')
figure('Name','系统G1和G7的幅相曲线','NumberTitle','off')
nyquist(G1), hold on;
nyquist(G7), grid on;
legend({'G1','G7'},'Location','best')
%% 综合练习
% x = [DELTA_V DELTA_alpha DELTA_q DELTA_theta]';   
% u = [DELTA_delta_e DELTA_delta_T]';
% x_dot = A*x + B*u
% y = C*x + D;
% input 1             2
%       DELTA_delta_e DELTA_delta_T
% output 1       2           3       4
%        DELTA_V DELTA_alpha DELTA_q DELTA_theta
A=[-0.0313 4.4879 0 -9.8; ...
    -0.0058 -0.7458 0.9480 0; ...
    -0.0002 -0.4479 -0.4609 0; ...
    0        0       1       0];
B=[0.2063 -0.0516 -0.6532 0; ...
    3.4847 -0.0561 0.0193 0]';
C=eye(4);
D=[0 0 0 0; 0 0 0 0]';
Gss=ss(A,B,C,D);
Gtf=tf(Gss);    %两个输入到四个输出的所有传函
% Gtf(output, input)
disp('DELTA_alpha/DELTA_delta_e 传递函数如下：')
G_elvt2atk=Gtf(2,1)
disp('DELTA_q/DELTA_delta_e 传递函数如下：')
G_elvt2pcr=Gtf(3,1)
disp('DELTA_theta/DELTA_delta_T 传递函数如下：')
G_trl2pich=Gtf(4,2)
disp('DELTA_V/DELTA_delta_T 传递函数如下：')
G_trl2vlct=Gtf(1,2)

[z,p,k]=zpkdata(G_elvt2atk);
disp('DELTA_alpha/DELTA_delta_e 零点如下：'),z{1}
disp('DELTA_alpha/DELTA_delta_e 极点如下：'),p{1}
[z,p,k]=zpkdata(G_elvt2pcr);
disp('DELTA_q/DELTA_delta_e 零点如下：'),z{1}
disp('DELTA_q/DELTA_delta_e 极点如下：'),p{1}
[z,p,k]=zpkdata(G_trl2pich);
disp('DELTA_theta/DELTA_delta_T 零点如下：'),z{1}
disp('DELTA_theta/DELTA_delta_T 极点如下：'),p{1}
[z,p,k]=zpkdata(G_trl2vlct);
disp('DELTA_V/DELTA_delta_T 零点如下：'),z{1}
disp('DELTA_V/DELTA_delta_T 极点如下：'),p{1}

disp('短周期和长周期自然频率和阻尼比如下：')
damp(G_elvt2pcr)

figure('Name','系统的阶跃响应曲线','NumberTitle','off')
step(Gtf)
figure('Name','系统脉冲响应曲线','NumberTitle','off')
impulse(Gtf)
% stepinfo求阶跃响应信息

figure('Name','升降舵到迎角的波特图','NumberTitle','off')
% bode(G_elvt2atk)
% [Gm,Pm,wcg,wc]= ...
margin(G_elvt2atk)
figure('Name','升降舵到俯仰角速率的波特图','NumberTitle','off')
% bode(G_elvt2pcr)
% [Gm,Pm,wcg,wc]= ...
margin(G_elvt2pcr)
figure('Name','油门到俯仰角的波特图','NumberTitle','off')
% bode(G_trl2pich)
% [Gm,Pm,wcg,wc]= ...
margin(G_trl2pich)

%% Simulink模型输出到工作空间画图
% 输入扰动系统响应曲线
figure('Name','系统响应曲线','NumberTitle','off')
subplot(2,2,1);
plot(t.data,DELTA_V.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\DeltaV','fontsize',12);
title('速度响应')
subplot(2,2,2);
plot(t.data,DELTA_alpha.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Delta\alpha','fontsize',12);
title('迎角响应')
subplot(2,2,3);
plot(t.data,DELTA_q.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Deltaq','fontsize',12);
title('俯仰角速率响应')
subplot(2,2,4);
plot(t.data,DELTA_theta.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Delta\theta','fontsize',12);
title('俯仰角响应')

% 状态初始扰动系统响应曲线
subplot(2,2,1);
plot(t.data,DELTA_V.data,'b--')
subplot(2,2,2);
plot(t.data,DELTA_alpha.data,'b--')
subplot(2,2,3);
plot(t.data,DELTA_q.data,'b--')
subplot(2,2,4);
plot(t.data,DELTA_theta.data,'b--')
legend({'输入扰动','状态初始扰动'},'Location','bestoutside')
