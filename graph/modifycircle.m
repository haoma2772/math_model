function [circle, long] = modifycircle(a,L,c);
for k = 1:L
    flag = 0;  % 退出的标记
    for m = 1 : L-2    % m为算法的i
        for n = m +2:L      % n为算法的j
            if a(c(m),c(n)) + a(c(m+1),c(n+1)) < a(c(m),c(m+1)) + a(c(n),c(n+1))
                c(m+1:n) = c(n:-1:m+1);
                flag = flag + 1; % 修改一次 标记加一
            end
        end
    end

    if flag == 0 % 一条边也没有修改 就返回
        long = 0; % 圈长的初始值
        for i = 1 : L
            long  = long + a(c(i),c(i+1)); % 求改良圈的长度
        end
      
        circle = c; % 返回修改圈
        return
    end
end
