%此脚本用于演示倒立摆的控制及线性二次调节器LQR的用法
%编写人：李广文
%单  位： 西北工业大学自动化学院
%时  间： 2021年4月20日

clc
clear

%已用S函数编写了倒立摆的模型，见InvertedPendulum.m
%设置倒立摆参数
L=1; %摆杆长度，单位:米；
m=0.2;%摆杆质量，单位：kg；
M=50;  %小车质量，单位：kg；
%倒立摆初始状态设置，
%状态分别对应：[摆杆位置，摆杆速率(m/s)，摆角(rad)，摆角速率(rad/s)]
X0=[0,0,0.1,0];

%获取倒立摆的线性化方程
[A,B,C,D]=linmod('InvertModel');

%设置加权阵
Q=1*eye(size(A)); %状态加权阵，半正定阵，Q越大意味着状态收敛越快
R=0.1;             %输入加权阵，应为正定阵，R越大意味着状态衰减慢。
N=zeros(size(A,1),size(B,2)); %状态和输入的协加权阵，一般为零矩阵

%利用LQR方法求全状态反馈控制器u=-Kx的系数
%[K,S,e] = lqr(A,B,Q,R,N);
%输出参数中K表示线性二次调节器u=-Kx的系数
% S表示由Q、R、N确定的Riccati方程的解；
% e表示全状态反馈构成的闭环系统特征根 e=eig(A-B*K)。
[K,S,e] = lqr(A,B,Q,R,N)

%进行仿真并画图
try
sim('InvertedPendulTest')
figure
subplot(2,2,1)
plot(t,Z,'linewidth',2);
xlabel('t/s');
ylabel('Z/m');
title('位置')
grid on

subplot(2,2,2)
plot(t,Zd,'linewidth',2);
xlabel('t/s');
ylabel('Zd/m.s^{-1}');
title('移动速度')
grid on

subplot(2,2,3)
plot(t,theta*180/pi,'linewidth',2);
xlabel('t/s');
ylabel('\theta/deg');
title('摆角')
grid on

subplot(2,2,4)
plot(t,thetaD*180/pi,'linewidth',2);
xlabel('t/s');
ylabel('\thetadot/deg.s^{-1}');
title('摆动角速度')
grid on
catch
    warndlg('解算发散，请重新设置初始状态','警告信息')
end




