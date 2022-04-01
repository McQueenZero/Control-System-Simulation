%用于演示fminsearch命令
clc
%设置迭代次数等优化搜索条件；
options=optimset('MaxIter',50);
%编写了和Simulink关联的函数myfun

%设定初值
X0=[20,1,1,0.1,1];

%进行搜索
X=fminsearch(@myfun,X0,options);
% %细致搜索
for index=1:3
  X=fminsearch(@myfun,X,options);
end

% X=lsqnonlin(@myfun,X0);
% %细致搜索
% for index=1:3
%     try
%     X=lsqnonlin(@myfun,X);
%     catch
%     end
% end
%仿真校验
sim('OPModel')
X