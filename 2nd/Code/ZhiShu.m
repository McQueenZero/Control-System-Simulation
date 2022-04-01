function Bool=ZhiShu(X)
Bool=0;
% function ZhiShu
i=2;
try
%     X=input('请输入数字=','s');
%     X=str2num(X);
%     if isempty(X)   %判断是否输入字母
%         disp('输入错误，请输入正整数') 
%     else
        if X<0||mod(X,1)~=0
            disp('输入错误，请输入正整数') %判断是否输入负数或非整数
        elseif X==0
            disp('0不是质数')
        elseif X==1
            disp('1不是质数')
        elseif X==2
            disp('此数为质数')
            Bool=1;
        else
            while i<X
                if mod(X,i)==0
                    disp(['此数不是质数，可以被',num2str(i),'整除'])
                    break;
                else
                    i=i+1;
                    if X==i
                        disp('此数为质数')
                        Bool=1;
                    end
                end
            end
        end
%     end
    
    EvenNum(X);
catch
    disp('输入错误，请输入正整数')
end

function EvenNum(X)
if X<0||mod(X,1)~=0
    disp('输入错误，请输入正整数') %判断是否输入负数或非整数
elseif mod(X,2)==0
    disp(['此数为偶数，其平方根为',num2str(sqrt(X))])
end

