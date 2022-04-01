clear,clc
index=1;
for i=0:100
    if ZhiShu(i)    %函数返回值为1，才给数组赋值
        PrimeNum(index)=i;
        index=index+1;
    end
end