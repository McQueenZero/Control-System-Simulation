%% 倒立摆模型输出画图
clc,close all

sim('mSFunction_DaolibaiLianxi');
figure('Name','倒立摆状态输出响应曲线','NumberTitle','off')
subplot(2,2,1)
plot(z.time,z.data,'LineWidth',1)
xlabel('t/s'),ylabel('data/m')
grid on,title('z')
subplot(2,2,2)
plot(zd.time,zd.data,'LineWidth',1)
xlabel('t/s'),ylabel('data/m{\cdot}s^{-1}')
grid on,title('zd')
subplot(2,2,3)
plot(theta.time,theta.data,'LineWidth',1)
xlabel('t/s'),ylabel('data/deg')
grid on,title('\theta')
subplot(2,2,4)
plot(thetad.time,thetad.data,'LineWidth',1)
xlabel('t/s'),ylabel('data/deg{\cdot}s^{-1}')
grid on,title('{\theta}d')

%% m-SFcn范例模型输出画图
sim('mSFunction_Fanli');
figure('Name','m-SFcn范例模型输出响应曲线','NumberTitle','off')
subplot(2,2,1)
plot(Ocsfunc.time,Ocsfunc.data,'LineWidth',1)
xlabel('t/s'),ylabel('data')
grid on,title('连续系统')
subplot(2,2,2)
stairs(Odsfunc.time,Odsfunc.data,'LineWidth',1) 
xlabel('t/s'),ylabel('data')
grid on,title('离散系统')
subplot(2,2,3)
plot(Omixedm.time,Omixedm.data,'LineWidth',1)
xlabel('t/s'),ylabel('data')
grid on,title('混合系统')
subplot(2,2,4)
plot(Ovsfunc.time,Ovsfunc.data,'LineWidth',1)
xlabel('t/s'),ylabel('data')
grid on,title('变步长系统')
