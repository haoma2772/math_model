function f = fun(x)
    M = 50000;                          % 超大数
    g =  x(1)^2 + x(2)^2 + 8;           % 这是objective function 注意是 min
    f = g - M*(min(x(1),0)) - M*min(x(2),0) - M*min((x(1)^2)-x(2),0) +  M*abs(-x(1)-x(2)^2+2);      % <=0 的是 加上max   >=0 是减去min  等于0是abs
end
