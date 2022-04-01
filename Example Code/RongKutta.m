%本程序用于演示Simulink的运行机制
%龙格库塔方法的理论基础来源于泰勒公式和使用斜率近似表达微分，
% 它在积分区间多预计算出几个点的斜率，然后进行加权平均，用做下一点的依据，
% 从而构造出了精度更高的数值积分计算方法。如果预先求两个点的斜率就是
% 二阶龙格库塔法，如果预先取四个点就是四阶龙格库塔法。
%演示用Runge-Kutta解线性方程Xdot=AX+BU
clc
clear 
close all

numK=[115];	
denK=[1 10 25 0];	
G=tf(numK,denK);
[num,den]=feedback(numK,denK,1,1);	%单位反馈
[A,B,C,D]=tf2ss(num,den);	        %传递函数转状态方程
x0=[0;0;0];%状态初值
ts=10;	%仿真时间
t0=0;	
h=0.01;%仿真步长
r=1;  %输入信号，阶跃输入
x=x0;
y=0; %输出初值
t=t0;
%以下为Runge-Kutta算法
%Xdot=AX+BU
%Y=CX+DU；
for index=1:ts/h	
    K1=A*x+B*r;	
    K2=A*(x+h*K1/2)+B*r;
    K3=A*(x+h*K2/2)+B*r;
    K4=A*(x+h*K3)+B*r;
    %解算状态值
    x=x+h*(K1+2*K2+2*K3+K4)/6;
    %按列保存输出值
    y=[y;C*x];
	t=[t;t(index)+h]; 
end
%调用Matalab的ode45函数计算各时刻的状态值
[TT,XX]=ode45(@DifFun,[0 10],[0 0 0]); %计算各时刻的状态值
% for index=1:length(TT)	
%       YY(index)=C*XX(index,:)'+D*r;
% end
%计算输出值，下面的结果和for循环结果相同。
YY=C*XX'+D*r;

sim('Simulink_Demo');%调用Simulink模型仿真
%画图对比
plot(t,y,'Linewidth',3)
hold on
plot(T,Y,'--','Linewidth',3,'color',[0.25 0.75 0.25]);
grid on
hold on
plot(TT,YY,'r-.','Linewidth',3)
grid on
legend('Runge-Kutta解算结果','Simulink运行结果','ode45函数解算结果')
	





