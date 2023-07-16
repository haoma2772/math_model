clear
clc
% 要明白 标准的是 min ft x         约束条件是小于等于和等于 
% 需要的话 可以取反 不过求max时候 取反以后  最后x是最终结果 但是y需要取反
% [x,fval] = linprog(f,a,b,aeq,beq,lb,ub)


% problem one：
% max z = 2x1 + 3x2 -5x3 ,
% s.t.
% x1 + x2 + x3 = 7,
% 2x1 - 5x2 + x3 >= 10,
% x1 + 3x2 + x3 <= 12,
% x1, x1 ,x3 >= 0.
% resolution:
f = [-2; -3; 5];     % f 是objective function； 每个系数是一个行
a = [-2, 5, -1; 1,3,1];     % a 是不等式 每一个不等式的系数 组成一行
b = [-10;12];               % b是不等式 的右边 每个数是一行
aeq = [1,1,1];              % aeq是等式 左边  同理 每一个等式组成一行
beq = 7;                    % beq是等死  每个数是一行
lb = [0;0;0];               % lb ub 分别是 自变量的范围 lb <=
% [x,y] = linprog(f,a,b,aeq,beq,lb);
% x,y= -y;

% problem tow:
% min z = 2x1 + 3x2 + x3,
% s.t.
% x1 + 4x2 + 2x3 >= 8,
% 3x1 +2x2 >= 5,
% x1,x2,x3 >= 0.
% resolution:
f = [2;3;1];
a = [-1,-4,-2;-3,-2,0];
b = [-8;-6];
aeq = [];
beq = [];
lb = [0;0;0];
% [x,y] = linprog(f,a,b,aeq,beq,lb);
% x,y;


% problem three:  need to convert
%  min z = |x1| + 2|x2| + 3|x3| + 4 |x4|,
% s.t.
% x1 - x2 - x3 + x4 <= -2,
% x1 - x2 + x3 - 3x4 <= -1;
% x1 - x2 - 2x3 + 3x4 <= -1/2.
% solution:
f = [1;2;3;4;1;2;3;4]; % f = 1 :4; f= [f,f]'         f还是这样 不过是两个系数和一起罢了
a = [1,-1,-1,1;1,-1,1,-3;1,-1,-2,3];               
a = [a,-a];                                           % a 是由[a,-a] 原来两个串联合成
b = [-2;-1;-1/2];                                       % b还是不等式右边
aeq = [];
beq = [];
lb = [0;0;0;0;0;0;0;0];
% [y,z] = linprog(f,a,b,aeq,beq,lb);
% x = y(1:4) - y(5:8)    % 恢复x = u-v
% z;












