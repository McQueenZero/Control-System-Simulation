%�˽ű�������ʾ�����ڵĿ��Ƽ����Զ��ε�����LQR���÷�
%��д�ˣ������
%��  λ�� ������ҵ��ѧ�Զ���ѧԺ
%ʱ  �䣺 2021��4��20��

clc
clear

%����S������д�˵����ڵ�ģ�ͣ���InvertedPendulum.m
%���õ����ڲ���
L=1; %�ڸ˳��ȣ���λ:�ף�
m=0.2;%�ڸ���������λ��kg��
M=50;  %С����������λ��kg��
%�����ڳ�ʼ״̬���ã�
%״̬�ֱ��Ӧ��[�ڸ�λ�ã��ڸ�����(m/s)���ڽ�(rad)���ڽ�����(rad/s)]
X0=[0,0,0.1,0];

%��ȡ�����ڵ����Ի�����
[A,B,C,D]=linmod('InvertModel');

%���ü�Ȩ��
Q=1*eye(size(A)); %״̬��Ȩ�󣬰�������QԽ����ζ��״̬����Խ��
R=0.1;             %�����Ȩ��ӦΪ������RԽ����ζ��״̬˥������
N=zeros(size(A,1),size(B,2)); %״̬�������Э��Ȩ��һ��Ϊ�����

%����LQR������ȫ״̬����������u=-Kx��ϵ��
%[K,S,e] = lqr(A,B,Q,R,N);
%���������K��ʾ���Զ��ε�����u=-Kx��ϵ��
% S��ʾ��Q��R��Nȷ����Riccati���̵Ľ⣻
% e��ʾȫ״̬�������ɵıջ�ϵͳ������ e=eig(A-B*K)��
[K,S,e] = lqr(A,B,Q,R,N)

%���з��沢��ͼ
try
sim('InvertedPendulTest')
figure
subplot(2,2,1)
plot(t,Z,'linewidth',2);
xlabel('t/s');
ylabel('Z/m');
title('λ��')
grid on

subplot(2,2,2)
plot(t,Zd,'linewidth',2);
xlabel('t/s');
ylabel('Zd/m.s^{-1}');
title('�ƶ��ٶ�')
grid on

subplot(2,2,3)
plot(t,theta*180/pi,'linewidth',2);
xlabel('t/s');
ylabel('\theta/deg');
title('�ڽ�')
grid on

subplot(2,2,4)
plot(t,thetaD*180/pi,'linewidth',2);
xlabel('t/s');
ylabel('\thetadot/deg.s^{-1}');
title('�ڶ����ٶ�')
grid on
catch
    warndlg('���㷢ɢ�����������ó�ʼ״̬','������Ϣ')
end



