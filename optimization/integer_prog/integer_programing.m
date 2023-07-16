clear
clc
% 整数规划问题
% [x, fval] = intlinprog(f, intcon , a,b aeq, beq,lb,ub)
% 对应模型是 min ft x,
% s.t.
% x 为整数
% A*X<=B
% Aeq * x = Beq
% lb <= x <= ub

% problem one:
% 求解下列 混合整数规划问题
% min z = -3x1 -2x2 - x3,
% s.t.
% x1 + x2 + x3 <= 7,
% 4x1 + 2x2 + x3 = 12,
% x1,x2>=0,
% x3 = 0 or 1
% solution:
f = [-3;-2;-1];
intcon = 3; % 整数变量的地址
a = [1,1,1];
b = [7];
aeq = [4,2,3];
beq = [12];
lb = [0;0;0];
ub = [inf;inf;1];
% [x,y] = intlinprog(f,intcon,a,b,aeq,beq,lb,ub)

% problem twp:
% 试将下述非线性问题0-1规划问题 转化为线性0-1规划问题
%  max z = x1 + x1*x2 - x3
% s.t.
% -2x1 + 3x2 + x3 <= 3
% xj = 0 或 1 j = 1 2 3 
% solution:
% 做代换 x4 = x1x2
% 原问题 即转化为
%  max z = x1 - x3 + x4
% s.t.
% -2x1 + 3x2 + x3 <= 3
% x1 + x2 -x4 <= 1
% -x1 + x4 <= 0
% -x2 + x4 <= 0
% xj = 0 或 1 j = 1 2 3 4
f = [1;0;-1;1];
intcon = [1,2,3,4];
a = [-2,3,3,0;1,1,0,-1;-1,0,0,1;0,-1,0,1];
b = [3;1;0;0];
aeq = [];
beq = [];
lb = [0;0;0;0;];
ub = [1;1;1;1];
% [x,y] = intlinprog(-f,intcon,a,b,aeq,beq,lb,ub);
% x,y=-y

