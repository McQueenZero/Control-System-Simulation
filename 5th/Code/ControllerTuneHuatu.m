%% ??????״̬??Ӧ????
clc,close all
load ControllerTuneResult

%% ??̬???ƻ?ͼ
figure('Name','??̬??????Ӧ????','NumberTitle','off')
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
legend({'??̬P','??̬PI','??̬PID'},'Location','best')

Stepinfo_thetaP_AT = stepinfo(State_thetaP_AT.data(:,4),State_thetaP_AT.time(:,4),5);
Stepinfo_thetaPI_AT = stepinfo(State_thetaPI_AT.data(:,4),State_thetaPI_AT.time(:,4),5);
Stepinfo_thetaPID_AT = stepinfo(State_thetaPID_AT.data(:,4),State_thetaPID_AT.time(:,4),5);
disp('P??̬???Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaP_AT.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaP_AT.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaP_AT.SettlingTime)])
disp('PI??̬???Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPI_AT.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPI_AT.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPI_AT.SettlingTime)])
disp('PID??̬???Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPID_AT.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPID_AT.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPID_AT.SettlingTime)])

%% ?ٶȿ??ƻ?ͼ
figure('Name','?ٶȿ?????Ӧ????','NumberTitle','off')
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
legend({'?ٶȿ?????','?ٶȿ???????P','?ٶȿ???????PI','?ٶȿ???????PID'},'Location','best')

Stepinfo_thetaPI_VAT = stepinfo(State_thetaPI_VAT.data(:,4),State_thetaPI_VAT.time(:,4),5);
Stepinfo_thetaPI_VP = stepinfo(State_thetaPI_VP.data(:,4),State_thetaPI_VP.time(:,4),5);
Stepinfo_thetaPI_VPI = stepinfo(State_thetaPI_VPI.data(:,4),State_thetaPI_VPI.time(:,4),5);
Stepinfo_thetaPI_VPID = stepinfo(State_thetaPI_VPID.data(:,4),State_thetaPI_VPID.time(:,4),5);
disp('?????ٶȿ??Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPI_VAT.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPI_VAT.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPI_VAT.SettlingTime)])
disp('P???????ٶȿ??Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPI_VP.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPI_VP.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPI_VP.SettlingTime)])
disp('PI???????ٶȿ??Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPI_VPI.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPI_VPI.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPI_VPI.SettlingTime)])
disp('PID???????ٶȿ??Ƹ????ǽ?Ծ??Ӧ??????')
disp(['??ֵʱ??(s)??' num2str(Stepinfo_thetaPI_VPID.PeakTime) ' ??????(%)??' num2str(Stepinfo_thetaPI_VPID.Overshoot) ' ????ʱ??(s)??' num2str(Stepinfo_thetaPI_VPID.SettlingTime)])
