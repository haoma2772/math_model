clear
clc
% non-linear-programing
% min fx
% s.t.
% a * x <= b;
% aeq * x = beq;
% c(x) <= 0
% ceq(x) = 0;
% lb <= x <= ub;
% [x,fval] = fmincon(f,x0,a,b,aeq,beq,lb,ub,nonlcon,options);
% a b aeq beq 仍是线性约束 没有的话就等于 []
% f 是由M文件 定义的函数f(x) x0 是x的初始值 nonlcon:c(x) 也是定义好的函数 ceq(x) 也是

% problem one:
% 求下列非线性规划
% min f(x) = x1^2 +  x2^2 + x3^2 + 8
% s.t.
% x1^2 -x2 + x3^2 > = 0
% x1 + x2^2 + x3^3 <= 20
% -x1 -x2^2 + 2 = 0
% x2 + 2 x3^2 = 3
% x1 x2 x3 >= 0
% solution:
[x,y] = fmincon('fun1',rand(3,1),[],[],[],[],zeros(3,1),[],'fun2')