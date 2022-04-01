%% ��ͼ��ϰ
clc,clear,close all
%% plot������ϰ
t=0:0.1*pi:2*pi;

subplot(3,1,1); %��3��1�е�һ����ͼ
plot(t,sin(t),'b-p');
grid on; axis tight; hold on;   %��ʾ���ߡ���������Ӧ������
title('sin(\alpha_\beta^{\theta+1})');
ax=gca;         %���뽫gca���������ʱ���ax
ax.GridAlpha=1; %ֱ��gca.GridAlpha=1�޷�����͸����

subplot(3,1,[2,3]); %��3��1�еڶ���������ͼ
plot(t,cos(t),'r-o');
grid on; axis tight; hold on;
plot(t,-cos(t),'m-^');
grid on; axis tight; hold on;
legend({'cos','-cos'},'Location','best','FontWeight','bold');
xlabel('\pi','fontsize',16);
title('cos')
ax=gca;
ax.GridAlpha=1;
%% ��ά���߻�ͼ��ϰ
x=0:0.1*pi:2*pi;    y=0:0.1*pi:2*pi;
Z=sin(x).*cos(y);
plot3(x,y,Z,'g-p','LineWidth',5);
grid on; hold on;
axis ([0 7 0 10 -0.5 0.5]);
xlabel('x','fontsize',16);
ylabel('y','fontsize',16);
zlabel('z','fontsize',16);
ax=gca;
ax.GridAlpha=1;
%% ��ά�����ͼ
x=0:0.1*pi:2*pi;    y=(0:0.1*pi:2*pi)';
Z=cos(y)*sin(x);    %���Ϊ���󣬲�����meshgrid
surf(x,y,Z);
grid on; hold on;
colormap jet;
axis ([0 7 0 8 -1 1]);
xlabel('x','fontsize',16);
ylabel('y','fontsize',16);
zlabel('z','fontsize',16);
ax=gca;
ax.GridAlpha=1;
%% ����ͼ��ϰ
t=-2*pi:0.1*pi:-2*pi+pi;
area(t,sin(t),'FaceColor','red'); hold on;
t=-1*pi:0.1*pi:-1*pi+pi;
area(t,sin(t),'FaceColor','blue'); hold on;
t=0:0.1*pi:pi;
area(t,sin(t),'FaceColor','green'); hold on;
t=pi:0.1*pi:2*pi;
area(t,sin(t),'FaceColor','cyan'); hold on;
axis tight;

figure
t=-5/2*pi:0.1*pi:-pi/2;
fill(t,sin(t),'red'); hold on;
t=-pi/2:0.1*pi:3/2*pi;
fill(t,sin(t),'green'); hold on;
t=3/2*pi:0.1*pi:7/2*pi;
fill(t,sin(t)','blue'); hold on;
axis ([-2*pi 2*pi -1 1]);

%difference example
figure
t=-pi:0.1*pi:pi/2;
area(t,sin(t),'FaceColor','green');
figure
fill(t,sin(t),'green');