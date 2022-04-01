%% 参数与状态响应加载
clc,close all
load ControllerTuneResult

%% 姿态控制画图
figure('Name','姿态控制响应曲线','NumberTitle','off')
subplot(2,2,1)
plot(State_thetaP_AT.time(:,1),State_thetaP_AT.data(:,1),'r--','LineWidth',1),hold on
plot(State_thetaPI_AT.time(:,1),State_thetaPI_AT.data(:,1),'k-','LineWidth',1),hold on
plot(State_thetaPID_AT.time(:,1),State_thetaPID_AT.data(:,1),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\DeltaV')
subplot(2,2,2)
plot(State_thetaP_AT.time(:,2),State_thetaP_AT.data(:,2),'r--','LineWidth',1),hold on
plot(State_thetaPI_AT.time(:,2),State_thetaPI_AT.data(:,2),'k-','LineWidth',1),hold on
plot(State_thetaPID_AT.time(:,2),State_thetaPID_AT.data(:,2),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Delta\alpha')
subplot(2,2,3)
plot(State_thetaP_AT.time(:,3),State_thetaP_AT.data(:,3),'r--','LineWidth',1),hold on
plot(State_thetaPI_AT.time(:,3),State_thetaPI_AT.data(:,3),'k-','LineWidth',1),hold on
plot(State_thetaPID_AT.time(:,3),State_thetaPID_AT.data(:,3),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Deltaq')
subplot(2,2,4)
plot(State_thetaP_AT.time(:,4),State_thetaP_AT.data(:,4),'r--','LineWidth',1),hold on
plot(State_thetaPI_AT.time(:,4),State_thetaPI_AT.data(:,4),'k-','LineWidth',1),hold on
plot(State_thetaPID_AT.time(:,4),State_thetaPID_AT.data(:,4),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Delta\theta')
legend({'姿态P','姿态PI','姿态PID'},'Location','best')

Stepinfo_thetaP_AT = stepinfo(State_thetaP_AT.data(:,4),State_thetaP_AT.time(:,4),5);
Stepinfo_thetaPI_AT = stepinfo(State_thetaPI_AT.data(:,4),State_thetaPI_AT.time(:,4),5);
Stepinfo_thetaPID_AT = stepinfo(State_thetaPID_AT.data(:,4),State_thetaPID_AT.time(:,4),5);
disp('P姿态控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaP_AT.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaP_AT.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaP_AT.SettlingTime)])
disp('PI姿态控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPI_AT.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPI_AT.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPI_AT.SettlingTime)])
disp('PID姿态控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPID_AT.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPID_AT.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPID_AT.SettlingTime)])

%% 速度控制画图
figure('Name','速度控制响应曲线','NumberTitle','off')
subplot(2,2,1)
plot(State_thetaPI_VAT.time(:,1),State_thetaPI_VAT.data(:,1),'m--','LineWidth',1),hold on
plot(State_thetaPI_VP.time(:,1),State_thetaPI_VP.data(:,1),'r--','LineWidth',1),hold on
plot(State_thetaPI_VPI.time(:,1),State_thetaPI_VPI.data(:,1),'k-','LineWidth',1),hold on
plot(State_thetaPI_VPID.time(:,1),State_thetaPI_VPID.data(:,1),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\DeltaV')
subplot(2,2,2)
plot(State_thetaPI_VAT.time(:,2),State_thetaPI_VAT.data(:,2),'m--','LineWidth',1),hold on
plot(State_thetaPI_VP.time(:,2),State_thetaPI_VP.data(:,2),'r--','LineWidth',1),hold on
plot(State_thetaPI_VPI.time(:,2),State_thetaPI_VPI.data(:,2),'k-','LineWidth',1),hold on
plot(State_thetaPI_VPID.time(:,2),State_thetaPI_VPID.data(:,2),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Delta\alpha')
subplot(2,2,3)
plot(State_thetaPI_VAT.time(:,3),State_thetaPI_VAT.data(:,3),'m--','LineWidth',1),hold on
plot(State_thetaPI_VP.time(:,3),State_thetaPI_VP.data(:,3),'r--','LineWidth',1),hold on
plot(State_thetaPI_VPI.time(:,3),State_thetaPI_VPI.data(:,3),'k-','LineWidth',1),hold on
plot(State_thetaPI_VPID.time(:,3),State_thetaPI_VPID.data(:,3),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Deltaq')
subplot(2,2,4)
plot(State_thetaPI_VAT.time(:,4),State_thetaPI_VAT.data(:,4),'m--','LineWidth',1),hold on
plot(State_thetaPI_VP.time(:,4),State_thetaPI_VP.data(:,4),'r--','LineWidth',1),hold on
plot(State_thetaPI_VPI.time(:,4),State_thetaPI_VPI.data(:,4),'k-','LineWidth',1),hold on
plot(State_thetaPI_VPID.time(:,4),State_thetaPI_VPID.data(:,4),'b-.','LineWidth',1),hold on
xlabel('time/s'),ylabel('data')
grid on,title('\Delta\theta')
legend({'速度控油门','速度控升降舵P','速度控升降舵PI','速度控升降舵PID'},'Location','best')

Stepinfo_thetaPI_VAT = stepinfo(State_thetaPI_VAT.data(:,4),State_thetaPI_VAT.time(:,4),5);
Stepinfo_thetaPI_VP = stepinfo(State_thetaPI_VP.data(:,4),State_thetaPI_VP.time(:,4),5);
Stepinfo_thetaPI_VPI = stepinfo(State_thetaPI_VPI.data(:,4),State_thetaPI_VPI.time(:,4),5);
Stepinfo_thetaPI_VPID = stepinfo(State_thetaPI_VPID.data(:,4),State_thetaPI_VPID.time(:,4),5);
disp('油门速度控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPI_VAT.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPI_VAT.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPI_VAT.SettlingTime)])
disp('P升降舵速度控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPI_VP.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPI_VP.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPI_VP.SettlingTime)])
disp('PI升降舵速度控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPI_VPI.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPI_VPI.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPI_VPI.SettlingTime)])
disp('PID升降舵速度控制俯仰角阶跃响应参数：')
disp(['峰值时间(s)：' num2str(Stepinfo_thetaPI_VPID.PeakTime) ' 超调量(%)：' num2str(Stepinfo_thetaPI_VPID.Overshoot) ' 调节时间(s)：' num2str(Stepinfo_thetaPI_VPID.SettlingTime)])
