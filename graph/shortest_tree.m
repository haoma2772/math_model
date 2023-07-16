clear
clc
x = [0 5 16 20 33 23 35 25 10];
y = [15 20 24 20 25 11 7 0 3];
xy = [x;y];
d = mandist(xy);        % 求两两向量间的绝对值距离
d = tril(d);          % 截取下三角矩阵 对称矩阵 取一半就行了
b = sparse(d)   % 转化为稀疏矩阵
[st, pre] = graphminspantree(b);
st = full(st);          % 把稀疏矩阵 转换回来
res_len = sum(sum(st))
view(biograph(st,[],'showarrows','on', 'showweights','on'))