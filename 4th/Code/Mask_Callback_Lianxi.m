clc,clear,close all
%% 子系统封装练习
TuneFun(0.1,3);
% PID参数在模型封装中手动设置
sim('PIDMODEL');
plot(C.time,C.data,'k--','LineWidth',1)
hold on
TuneFun(0.707,5);
sim('PIDMODEL');
plot(C.time,C.data,'b-','LineWidth',1)
hold on
TuneFun(0.9,1);
sim('PIDMODEL');
plot(C.time,C.data,'r-.','LineWidth',1)
hold on
grid on
legend({'\xi=0.1,\omega=3','\xi=0.707,\omega=5','\xi=0.9,\omega=1'}, ...
    'Location','best','fontsize',11)
title('PIDMODEL的阶跃响应曲线')

%% 求系统模型练习
[A,B,C,D]=linmod('QiuXitongMoxing');
G=tf(ss(A,B,C,D))
