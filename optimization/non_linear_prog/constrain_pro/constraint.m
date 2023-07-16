clear
clc


% 二次规划问题
% objection function 为 自变量x的二次函数    约束条件 又都是线性的
%  min 1/2 xt H x + ft x
% s.t.
% AX <= B;
% aeq x = beq
% lb <= x <= ub
% [x,fval] = quadprog(H,f,a,b,aeq,beq,lb,ub,x0,options)


% problem one：
% min f(x) = 2x1^2 - 4x1x2 + 4x2^2 -6x1 - 3x2
% s.t.
% x1+ x2 <= 3
% 4x1 + x2 <= 9
% x1,x2>=0
% solution:
h =[4,-4;-4,8];
f = [-6;-3];
a = [1,1;4,1;];
b=[3;9];
aeq = [];
beq = [];
lb = zeros(2,1);
ub = [];
x0 = rand(2,1);
[x,y] = quadprog(h,f,a,b,aeq,beq,lb,ub,x0)

clear
clc
% 罚函数法 求非线性规划问题求解转化为无约束极值问题
% min fx
%   s.t.
%    gx <= 0
%    hx >= 0
%    kx = 0
% 需要在另一个m文件定义函数       
% 函数 p = f(objective function) + M*sum(max(g,0)) -M*sum((min(h,0))) + sum abs(kx)
% 外罚函数法

% problem two：
% min fx = x1^2 + x2^2+8
% s.t.  x1^2 - x2 >= 0
%   -x1 - x2^2 + 2 = 0
% x1 x2 >= 0
% solution
[x,y] = fminsearch('fun',rand(2,1))


clear
clc
% fminbnd函数   求单变量非线性函数在区间的极小值 [x1,x2]
% [x,fval] = fminbnd(fun,x1,x2,options)     fun也是m文件的函数
% 太简单

clear
clc
% fseminf函数
% min fx
% s.t.
% a*x <= b
% aeq x = beq
% lb <= x <= ub
% cx <= 0
% ceq x =0
% ki(x,wi) <=0   1=<i<=n
% [x,fval] = fseminf(fun,x0,ntheta,seminfcon,a,b,aeq,beq,lb,ub)
% x0是初始值 ntheta是半无穷约束ki(x,wi)的个数
% seminfcon 用于定义非线性不等式约束cx  非线性等式约束ceqx 和半无穷约束ki（x，wi）的函数
% seminfcon有两个输出参量x 和 s s是步长

% problem three:
% 求函数 fx = (x1 - 0.5)^2 + (x2-0.5)^2 + (x3-0.5)^2
% K1(x,w1) = sin(w1x1)cos(w1x2) - 1/1000(w1-50)^2 -sin(w1x3)-x3 <= 1
% k2(x,w2) = sin(w2x2)cos(w2x1) - 1/1000(w2-50)^2-sin(w2x3)-x3 <= 1
% 1=<x1 <= 100, 1<=w2<=100
% solution:
% 每次结果可能不一样 有随机数在 所以是一个局部解
x0 =rand(3,1);
[x,y] = fseminf('fun7',x0,2,'fun8')





















