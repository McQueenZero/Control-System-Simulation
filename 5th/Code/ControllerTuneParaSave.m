%% �����������������ݱ���
clc,close all
% ��ȡ����ͬ������������״̬���������
%% ���㣬��ֹ��������ͣ��
Kq=0;Ktheta=0;KthetaD=0;KthetaI=0;KthetaV=0;KqV=0;KDeltaV=0;Lq=0;Ltheta=0;LV=0;LVdot=0;LVI=0;

%% P��̬���ƣ��Զ����ſ�
State_thetaP_AT.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaP_AT.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaP_AT.paraname = ["Kq","Ktheta","KthetaV","KqV","KDeltaV"];
State_thetaP_AT.para = [Kq Ktheta KthetaV KqV KDeltaV];

%% PI��̬���ƣ��Զ����ſ�
State_thetaPI_AT.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPI_AT.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPI_AT.paraname = ["Kq","Ktheta","KthetaI","KthetaV","KqV","KDeltaV"];
State_thetaPI_AT.para = [Kq Ktheta KthetaI KthetaV KqV KDeltaV];

%% PID��̬���ƣ��Զ����ſ�
State_thetaPID_AT.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPID_AT.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPID_AT.paraname = ["Kq","Ktheta","KthetaD","KthetaI","KthetaV","KqV","KDeltaV"];
State_thetaPID_AT.para = [Kq Ktheta KthetaD KthetaI KthetaV KqV KDeltaV];

%% �����ٶȿ��ƣ�PI��̬����
State_thetaPI_VAT.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPI_VAT.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPI_VAT.paraname = ["Kq","Ktheta","KthetaI","KthetaV","KqV","KDeltaV"];
State_thetaPI_VAT.para = [Kq Ktheta KthetaI KthetaV KqV KDeltaV];

%% P�������ٶȿ��ƣ�PI��̬���ƣ��Զ����ſ�
State_thetaPI_VP.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPI_VP.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPI_VP.paraname = ["Kq","Ktheta","KthetaI","KthetaV","KqV","KDeltaV","Lq","Ltheta","LV"];
State_thetaPI_VP.para = [Kq Ktheta KthetaI KthetaV KqV KDeltaV Lq Ltheta LV];

%% PI�������ٶȿ��ƣ�PI��̬���ƣ��Զ����ſ�
State_thetaPI_VPI.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPI_VPI.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPI_VPI.paraname = ["Kq","Ktheta","KthetaI","KthetaV","KqV","KDeltaV","Lq","Ltheta","LV","LVI"];
State_thetaPI_VPI.para = [Kq Ktheta KthetaI KthetaV KqV KDeltaV Lq Ltheta LV LVI];

%% PID�������ٶȿ��ƣ�PI��̬���ƣ��Զ����ſ�
State_thetaPI_VPID.data = [DELTA_V.data DELTA_alpha.data DELTA_q.data DELTA_theta.data];
State_thetaPI_VPID.time = [DELTA_V.time DELTA_alpha.time DELTA_q.time DELTA_theta.time];
State_thetaPI_VPID.paraname = ["Kq","Ktheta","KthetaI","KthetaV","KqV","KDeltaV","Lq","Ltheta","LV","LVdot","LVI"];
State_thetaPI_VPID.para = [Kq Ktheta KthetaI KthetaV KqV KDeltaV Lq Ltheta LV LVdot LVI];

%% ������״̬��Ӧ����
save ControllerTuneResult State_thetaP_AT State_thetaPI_AT State_thetaPID_AT State_thetaPI_VAT State_thetaPI_VP State_thetaPI_VPI State_thetaPI_VPID