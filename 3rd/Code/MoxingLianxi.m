%% ϵͳ����ģ����ϰ
clc,clear,close all
%% ��������
G1=tf([1 1],[1 2 1])
G2=minreal(G1)
G3=zpk(G1)
G4=feedback(G1,G2)
G5=feedback(G1,G2,+1)
G6=tf([1 1],[1 2 1],0.01)
%% ģ��ת��
[A,B,C,D]=tf2ss(G1.num{1},G1.den{1})    %ע��G1.num��G1.denΪԪ����������ø�ʽ
W1=c2d(G1,0.1,'ZOH')
W2=c2d(G1,0.01,'ZOH')
W3=c2d(G1,0.1,'Tustin')
W4=c2d(G1,0.01,'Tustin')
%% Ƶ�����
figure('Name','ϵͳG4�Ĳ���ͼ','NumberTitle','off'),bode(G1*G2),grid on;
title('ϵͳG4�Ĳ���ͼ')
figure('Name','ϵͳG4�ķ�ֵԣ�Ⱥ����ԣ��','NumberTitle','off'),margin(G1*G2),grid on;
figure('Name','ϵͳG4���ο�˹��ͼ','NumberTitle','off'),nyquist(G1*G2),grid on;
title('ϵͳG4���ο�˹��ͼ')
figure('Name','ϵͳG4����¶�˹����','NumberTitle','off'),nichols(G1*G2),grid on;
title('ϵͳG4����¶�˹����')
figure('Name','ϵͳG4�ĸ��켣����','NumberTitle','off'),rlocus(G1*G2),grid on;
title('ϵͳG4�ĸ��켣����')
disp('ϵͳG4�ķ�ֵԣ�Ⱥ����ԣ�����£�')
[Gm,Pm,wcg,wc]=margin(G1*G2)
figure('Name','ϵͳG5�Ĳ���ͼ','NumberTitle','off'),bode(-G1*G2),grid on;
title('ϵͳG5�Ĳ���ͼ')
figure('Name','ϵͳG5�ķ�ֵԣ�Ⱥ����ԣ��','NumberTitle','off'),margin(-G1*G2),grid on;
figure('Name','ϵͳG5���ο�˹��ͼ','NumberTitle','off'),nyquist(-G1*G2),grid on;
title('ϵͳG5���ο�˹��ͼ')
figure('Name','ϵͳG5����¶�˹����','NumberTitle','off'),nichols(-G1*G2),grid on;
title('ϵͳG5����¶�˹����')
figure('Name','ϵͳG5�ĸ��켣����','NumberTitle','off'),rlocus(-G1*G2),grid on;
title('ϵͳG5�ĸ��켣����')
disp('ϵͳG5�ķ�ֵԣ�Ⱥ����ԣ�����£�')
[Gm,Pm,wcg,wc]=margin(-G1*G2)
%% ���ͺ󻷽ڴ���
G7=tf([1 1],[1 2 1],'iodelay',1)
figure('Name','ϵͳG1��G7�Ľ�Ծ��Ӧ','NumberTitle','off')
step(G1), hold on;
step(G7), grid on;
legend({'G1','G7'},'Location','best')
figure('Name','ϵͳG1��G7�ķ�������','NumberTitle','off')
nyquist(G1), hold on;
nyquist(G7), grid on;
legend({'G1','G7'},'Location','best')
%% �ۺ���ϰ
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
Gtf=tf(Gss);    %�������뵽�ĸ���������д���
% Gtf(output, input)
disp('DELTA_alpha/DELTA_delta_e ���ݺ������£�')
G_elvt2atk=Gtf(2,1)
disp('DELTA_q/DELTA_delta_e ���ݺ������£�')
G_elvt2pcr=Gtf(3,1)
disp('DELTA_theta/DELTA_delta_T ���ݺ������£�')
G_trl2pich=Gtf(4,2)
disp('DELTA_V/DELTA_delta_T ���ݺ������£�')
G_trl2vlct=Gtf(1,2)

[z,p,k]=zpkdata(G_elvt2atk);
disp('DELTA_alpha/DELTA_delta_e ������£�'),z{1}
disp('DELTA_alpha/DELTA_delta_e �������£�'),p{1}
[z,p,k]=zpkdata(G_elvt2pcr);
disp('DELTA_q/DELTA_delta_e ������£�'),z{1}
disp('DELTA_q/DELTA_delta_e �������£�'),p{1}
[z,p,k]=zpkdata(G_trl2pich);
disp('DELTA_theta/DELTA_delta_T ������£�'),z{1}
disp('DELTA_theta/DELTA_delta_T �������£�'),p{1}
[z,p,k]=zpkdata(G_trl2vlct);
disp('DELTA_V/DELTA_delta_T ������£�'),z{1}
disp('DELTA_V/DELTA_delta_T �������£�'),p{1}

disp('�����ںͳ�������ȻƵ�ʺ���������£�')
damp(G_elvt2pcr)

figure('Name','ϵͳ�Ľ�Ծ��Ӧ����','NumberTitle','off')
step(Gtf)
figure('Name','ϵͳ������Ӧ����','NumberTitle','off')
impulse(Gtf)
% stepinfo���Ծ��Ӧ��Ϣ

figure('Name','�����浽ӭ�ǵĲ���ͼ','NumberTitle','off')
% bode(G_elvt2atk)
% [Gm,Pm,wcg,wc]= ...
margin(G_elvt2atk)
figure('Name','�����浽���������ʵĲ���ͼ','NumberTitle','off')
% bode(G_elvt2pcr)
% [Gm,Pm,wcg,wc]= ...
margin(G_elvt2pcr)
figure('Name','���ŵ������ǵĲ���ͼ','NumberTitle','off')
% bode(G_trl2pich)
% [Gm,Pm,wcg,wc]= ...
margin(G_trl2pich)

%% Simulinkģ������������ռ仭ͼ
% �����Ŷ�ϵͳ��Ӧ����
figure('Name','ϵͳ��Ӧ����','NumberTitle','off')
subplot(2,2,1);
plot(t.data,DELTA_V.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\DeltaV','fontsize',12);
title('�ٶ���Ӧ')
subplot(2,2,2);
plot(t.data,DELTA_alpha.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Delta\alpha','fontsize',12);
title('ӭ����Ӧ')
subplot(2,2,3);
plot(t.data,DELTA_q.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Deltaq','fontsize',12);
title('������������Ӧ')
subplot(2,2,4);
plot(t.data,DELTA_theta.data,'r'),grid on,hold on
xlabel('t','fontsize',12);
ylabel('\Delta\theta','fontsize',12);
title('��������Ӧ')

% ״̬��ʼ�Ŷ�ϵͳ��Ӧ����
subplot(2,2,1);
plot(t.data,DELTA_V.data,'b--')
subplot(2,2,2);
plot(t.data,DELTA_alpha.data,'b--')
subplot(2,2,3);
plot(t.data,DELTA_q.data,'b--')
subplot(2,2,4);
plot(t.data,DELTA_theta.data,'b--')
legend({'�����Ŷ�','״̬��ʼ�Ŷ�'},'Location','bestoutside')