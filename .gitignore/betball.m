function [x, fval]=betball(rate)
%%1*n的赔率行数组就可以,比如：
%输入赔率1
%        rate:赔率
%%
s = size(rate);%赔率的数量

money = 500;%押注金额

A = zeros(s(2)+1,s(2));%构建不等式（最后一行为押注金额小于500）

for i=1:s(2)
    
    A(i,i) = - rate(i);
    
    A(s(2)+1,i)=1;
    
end

f = A(1, :);

b = -money*ones(s(2)+1,1);

b(s(2)+1) = money;

lb = zeros(s(2),1);

Aeq=zeros(s(2)-1,s(2));

for j=1:s(2)-1
    
    Aeq(j,1) = -rate(1);
    
    Aeq(j,j+1) =  rate(j+1);
    
end

beq=zeros(s(2)-1,1);

[x,fval] =linprog(f,A,b,Aeq,beq,lb);%先看有没有解

fval = -fval - money;%赚的钱
end
