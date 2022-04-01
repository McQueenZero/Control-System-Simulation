%% 创建多维数组
MA=rand(2,2,2);
MA(:,:,1)=rand(2,2);
MA(:,:,2)=zeros(2,2);
%% 查找和排序的练习
clc,clear;
SS=rand(101,1);
[SC,Pos]=sort(SS,'descend');  %按降序排列
SC_mid=SC((1+101)/2)  %返回排序后中间值
SC_mid_Pos=Pos((1+101)/2)  %返回该值在SS数组中的位置
Index=find(~(SS-SC_mid)) %find找非0值，所以取反使用，找0值，也返回该值在SS数组中的位置
%% 结构体数组练习
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
%% 单元/元胞数组练习
clc,clear;
S_exce(:,:,1)=[struct('Name','Glaz','Weight',79,'BloodType','A'), ...
    struct('Name','Fuze','Weight',80,'BloodType','A'); ...
    struct('Name','Kapkan','Weight',80,'BloodType','O'), ...
    struct('Name','Tachanka','Weight',70,'BloodType','B')];
S_exce(:,:,2)=[struct('Name','Ash','Weight',63,'BloodType','B'), ...
    struct('Name','Thermite','Weight',80,'BloodType','O'); ...
    struct('Name','Castle','Weight',86,'BloodType','A'), ...
    struct('Name','Pulse','Weight',85,'BloodType','AB')];
Cell_exce(:,:,1)={'赵敏琨',S_exce;'2018302068',[]};
Cell_exce(:,:,2)={'赵敏琨',S_exce;'2018302068',[]};
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
%% 字符串的创建和使用
clc,clear;
for index=0:2:100
    eval(['A' num2str(index) '=(sqrt(index+1)-5)^2;'])
end