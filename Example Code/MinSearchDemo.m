%������ʾfminsearch����
clc
%���õ����������Ż�����������
options=optimset('MaxIter',50);
%��д�˺�Simulink�����ĺ���myfun

%�趨��ֵ
X0=[20,1,1,0.1,1];

%��������
X=fminsearch(@myfun,X0,options);
% %ϸ������
for index=1:3
  X=fminsearch(@myfun,X,options);
end

% X=lsqnonlin(@myfun,X0);
% %ϸ������
% for index=1:3
%     try
%     X=lsqnonlin(@myfun,X);
%     catch
%     end
% end
%����У��
sim('OPModel')
X