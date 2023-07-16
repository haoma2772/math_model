clear
clc

% 无约束问题 极值 数值解
% min fx
% 使用 [x,fval] = fminunc(fun,x0,options) 默认极小值
%


% problem one:
% 求多元函数 f(x,y) = x^3 - y^3 + 3*x^2 + 3*y^2 -9*x 的极值
% soluton:
f = @(x)  x(1)^3 -x(2)^3 +3*x(1)^2 + 3*x(2)^2 -9*x(1);   %定义 匿名函数   以后这样写也可以
g = @(x)  -f(x);
[xy1,z1] = fminunc(f,rand(2,1));
[xy2,z2] = fminunc(g,rand(2,1));            % 记得最大值的话 把原函数的值要取反  自变量是一样的
xy2; z2 = -z2;

clear
clc

% problem two:
% 求函数fx = 100(x2 - x1^2)^2 + (1-x1)^2 的极小值
%  solution:
f = @(x) 100*(x(2) - x(1)^2)^2 + (1-x(1))^2;        
[x, z] = fminunc(f,rand(2,1));



clear
clc
% problem three ：
% 求如下方程组的解
% x^2 + y - 6 = 0
% y^2 + x - 6 = 0
% solution
syms x y
[x,y] = solve(x^2 + y -6 , y^2 + x - 6) %用于求解方程 或者方程组的解









