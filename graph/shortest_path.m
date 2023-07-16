clear
clc
% problem one:
% 求v1 到 v11的最短路径和长度
% 图用邻接矩阵存储
a(1,2) = 2;a(1,3) =8;a(1,4) = 1;
a(2,3) = 1;a(2,3) = 6;a(2,5) = 1;
a(3,4) = 7;a(3,5) = 5;a(3,6) = 1;
a(3,7) = 2;
a(4,7) = 9;
a(5,6) = 3;a(5,8) = 2;a(5,9) = 9;
a(6,7) = 4;a(6,9) = 6;
a(7,9) = 3;a(7,10) = 1;
a(8,9) = 7;a(8,11) = 9;
a(9,10) = 1;a(9,11) = 2;
a(10,11) = 4;
%  如何创建图 下面 固定格式呗
% 因为是无向图 保存成稀疏图需要这样操作
a = a';       % 下三角形式 第一步
[i,j,v] = find(a); % 第二步找到非零的 行列值索引 
b = sparse(i,j,v,11,11); % 构造稀疏矩阵 第三步       i j v 分别是 行列索引和值  后面是 大小 11*11
% x 是dis y 是 path z 是pre_node
% 输入是 graph S D FR
% 画图
h = biograph(b,[],'showweights','on');  % 首先转化成生物图 biograph
view(h)
[x,y,z] = graphshortestpath(b,1,11,'Directed',0)   % directed标志为有向图
