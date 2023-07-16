clear
clc






% problem one：
% 求多元函数 f(x,y) = x^3 - y^3 + 3x^2 + 3y^2 -9x 的极值
% solution:
syms x y       % 创建符号变量 中间是空格
f = x^3 - y^3 + 3*x^2 + 3*y^2 -9*x;     % 函数表达式
df = jacobian(f);   % 一阶偏导       jacobian() 偏导公式
d2f = jacobian(df);   % hessian矩阵
[xx,yy] = solve(df);   % 求驻点  求解返回的是 不同b个解 每个解是个vector n行1列
xx = double(xx);        yy = double(yy); % 转化为双精度的数据 判断特征值正负 必须为数值类型数据
for i = 1:length(xx)        % 没有 ：
    % new_expression = subs(expression, old_variables, new_values)
    a = subs(d2f,{x,y},{xx(i),yy(i)});   % 这是把 数 代入变量的写法 得到具体化的  subs()是代替的意思
    b = eig(a); % 求特征值
    f = subs(f,{x,y},{xx(i),yy(i)});        % 求解f
    f = double(f);
    if all(b >0)
        fprintf('(%f %f) 是极小值点， 对应的极小值为 %f\n',xx(i),yy(i),f);
    elseif all(b<0)
         fprintf('(%f %f) 是极大值点， 对应的极大值为 %f\n',xx(i),yy(i),f);
    elseif any(b>0) & any(b<0)
          fprintf('(%f %f) 既不是最大值 也不是最小值\n ',xx(i),yy(i));
    else
        fprintf('无法判断(%f %f) 是否是极值点\n', xx(i),yy(i));
    end
end
