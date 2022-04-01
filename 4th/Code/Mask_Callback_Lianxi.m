clc,clear,close all
%% ��ϵͳ��װ��ϰ
TuneFun(0.1,3);
% PID������ģ�ͷ�װ���ֶ�����
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
title('PIDMODEL�Ľ�Ծ��Ӧ����')

%% ��ϵͳģ����ϰ
[A,B,C,D]=linmod('QiuXitongMoxing');
G=tf(ss(A,B,C,D))