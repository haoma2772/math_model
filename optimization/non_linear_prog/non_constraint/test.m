clear
clc
% 创建一个方阵
A = [1 2 3; 4 5 6; 7 8 9];

% 计算 A 的特征值和特征向量
[V, D] = eig(A);

% 打印特征值
eigenvalues = diag(D);
disp('特征值:');
disp(eigenvalues.');

% 打印特征向量
disp('特征向量:');
disp(V);
