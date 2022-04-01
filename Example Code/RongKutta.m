%������������ʾSimulink�����л���
%����������������ۻ�����Դ��̩�չ�ʽ��ʹ��б�ʽ��Ʊ���΢�֣�
% ���ڻ��������Ԥ������������б�ʣ�Ȼ����м�Ȩƽ����������һ������ݣ�
% �Ӷ�������˾��ȸ��ߵ���ֵ���ּ��㷽�������Ԥ�����������б�ʾ���
% ������������������Ԥ��ȡ�ĸ�������Ľ������������
%��ʾ��Runge-Kutta�����Է���Xdot=AX+BU
clc
clear 
close all

numK=[115];	
denK=[1 10 25 0];	
G=tf(numK,denK);
[num,den]=feedback(numK,denK,1,1);	%��λ����
[A,B,C,D]=tf2ss(num,den);	        %���ݺ���ת״̬����
x0=[0;0;0];%״̬��ֵ
ts=10;	%����ʱ��
t0=0;	
h=0.01;%���沽��
r=1;  %�����źţ���Ծ����
x=x0;
y=0; %�����ֵ
t=t0;
%����ΪRunge-Kutta�㷨
%Xdot=AX+BU
%Y=CX+DU��
for index=1:ts/h	
    K1=A*x+B*r;	
    K2=A*(x+h*K1/2)+B*r;
    K3=A*(x+h*K2/2)+B*r;
    K4=A*(x+h*K3)+B*r;
    %����״ֵ̬
    x=x+h*(K1+2*K2+2*K3+K4)/6;
    %���б������ֵ
    y=[y;C*x];
	t=[t;t(index)+h]; 
end
%����Matalab��ode45���������ʱ�̵�״ֵ̬
[TT,XX]=ode45(@DifFun,[0 10],[0 0 0]); %�����ʱ�̵�״ֵ̬
% for index=1:length(TT)	
%       YY(index)=C*XX(index,:)'+D*r;
% end
%�������ֵ������Ľ����forѭ�������ͬ��
YY=C*XX'+D*r;

sim('Simulink_Demo');%����Simulinkģ�ͷ���
%��ͼ�Ա�
plot(t,y,'Linewidth',3)
hold on
plot(T,Y,'--','Linewidth',3,'color',[0.25 0.75 0.25]);
grid on
hold on
plot(TT,YY,'r-.','Linewidth',3)
grid on
legend('Runge-Kutta������','Simulink���н��','ode45����������')
	




