%% ������ά����
MA=rand(2,2,2);
MA(:,:,1)=rand(2,2);
MA(:,:,2)=zeros(2,2);
%% ���Һ��������ϰ
clc,clear;
SS=rand(101,1);
[SC,Pos]=sort(SS,'descend');  %����������
SC_mid=SC((1+101)/2)  %����������м�ֵ
SC_mid_Pos=Pos((1+101)/2)  %���ظ�ֵ��SS�����е�λ��
Index=find(~(SS-SC_mid)) %find�ҷ�0ֵ������ȡ��ʹ�ã���0ֵ��Ҳ���ظ�ֵ��SS�����е�λ��
%% �ṹ��������ϰ
clc,clear;
S_exce(:,:,1)=[struct('Name','Glaz','Weight',79,'BloodType','A'), ...
    struct('Name','Fuze','Weight',80,'BloodType','A'); ...
    struct('Name','Kapkan','Weight',80,'BloodType','O'), ...
    struct('Name','Tachanka','Weight',70,'BloodType','B')];
S_exce(:,:,2)=[struct('Name','Ash','Weight',63,'BloodType','B'), ...
    struct('Name','Thermite','Weight',80,'BloodType','O'); ...
    struct('Name','Castle','Weight',86,'BloodType','A'), ...
    struct('Name','Pulse','Weight',85,'BloodType','AB')];
fieldnames(S_exce)
getfield(S_exce(1,2,1),'Name')
S_exce(1,2,1)=setfield(S_exce(1,2,1),'Name','Hostage Killer')
getfield(S_exce(1,2,1),'Name')
getfield(S_exce(1,1,2),'Name')
S_exce(1,1,2)=setfield(S_exce(1,1,2),'Name','Fivespeed Headless Monster')
getfield(S_exce(1,1,2),'Name')
Russian_bomb=rmfield(S_exce(1,2,1),'Name')
%% ��Ԫ/Ԫ��������ϰ
clc,clear;
S_exce(:,:,1)=[struct('Name','Glaz','Weight',79,'BloodType','A'), ...
    struct('Name','Fuze','Weight',80,'BloodType','A'); ...
    struct('Name','Kapkan','Weight',80,'BloodType','O'), ...
    struct('Name','Tachanka','Weight',70,'BloodType','B')];
S_exce(:,:,2)=[struct('Name','Ash','Weight',63,'BloodType','B'), ...
    struct('Name','Thermite','Weight',80,'BloodType','O'); ...
    struct('Name','Castle','Weight',86,'BloodType','A'), ...
    struct('Name','Pulse','Weight',85,'BloodType','AB')];
Cell_exce(:,:,1)={'������',S_exce;'2018302068',[]};
Cell_exce(:,:,2)={'������',S_exce;'2018302068',[]};
Cell_exce
S=0;
for n=1:2
    for k=1:2
        for l=1:2
            for m=1:2
                S=S+getfield(Cell_exce{1,2,n}(k,l,m),'Weight');
            end
        end
    end
end
M=S/(n*k*l*m)
%% �ַ����Ĵ�����ʹ��
clc,clear;
for index=0:2:100
    eval(['A' num2str(index) '=(sqrt(index+1)-5)^2;'])
end