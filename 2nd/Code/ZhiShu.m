function Bool=ZhiShu(X)
Bool=0;
% function ZhiShu
i=2;
try
%     X=input('����������=','s');
%     X=str2num(X);
%     if isempty(X)   %�ж��Ƿ�������ĸ
%         disp('�������������������') 
%     else
        if X<0||mod(X,1)~=0
            disp('�������������������') %�ж��Ƿ����븺���������
        elseif X==0
            disp('0��������')
        elseif X==1
            disp('1��������')
        elseif X==2
            disp('����Ϊ����')
            Bool=1;
        else
            while i<X
                if mod(X,i)==0
                    disp(['�����������������Ա�',num2str(i),'����'])
                    break;
                else
                    i=i+1;
                    if X==i
                        disp('����Ϊ����')
                        Bool=1;
                    end
                end
            end
        end
%     end
    
    EvenNum(X);
catch
    disp('�������������������')
end

function EvenNum(X)
if X<0||mod(X,1)~=0
    disp('�������������������') %�ж��Ƿ����븺���������
elseif mod(X,2)==0
    disp(['����Ϊż������ƽ����Ϊ',num2str(sqrt(X))])
end
