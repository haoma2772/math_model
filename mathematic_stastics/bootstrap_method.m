clear
clc

% 总体分布F 未知 但已有一个容量为n 的 来自 分布F的数据样本
% 自 这一样本 按放回抽样的方法 抽取一个容量 为n的样本 这种样本 称为Bootstrap样本
% 或称为自助样本
% 相继地 独立地自原始样本中取很多个 Bootstrap样本 利用这些样本对总体F进行统计推断 这种方法称为 非参数Bootstrap方法
% 又称自助法
% 这一方法 可以用于当人们对总体知之甚少的情况 它是近代统计中的一种用于数据处理的重要实用方法
% 在估计总体未知参数 θ时 人们不但要给出θ的估计θ hat， 还需要指出这一估计的精度
% 通常 我们用估计量θ hat 的标准差 来度量估计的精度
% 有B个 容量为n 的 从F中取的的 样本
% sigma hat = 根号（sum（θhat- θbar）^2 / （B-1）） 来估计

% 标准差是衡量一组数据的离散程度的统计量，表示数据点与其平均值之间的平均距离。
% problem one： 标准误差的Bootstrap估计
% 某种基金的年回报率 是具有分布函数F的 连续型随机变量 F 未知 F的中位数θ是未知参数
% 现在有以下数据 以样本中位数作为总体中位数θ的估计 试求中位数估计的标准误差的bootstrap估计
data = [18.2 9.5 12.0 21.2 10.2];
% 下面是计算各个样本的中位数
% q = quantile(data, p)  计算 分位数 p是比例
% 匿名函数
% function_handle = @(arg1, arg2, ..., argN) expression
% 反正第二个是函数 
b = bootstrp(1000,@ (x) quantile(x,0.5),data);
c= std(b);


% problem two：
% 均方误差的Bootsstrap估计
% 设X = (X1, X2, ... XN)是来自总体F的样本 F未知 R= R（X） 是感兴趣的随机变量
% 它依赖于样本X 假设我们希望去估计R的分布的某些特征 例如Ef（R）的数学期望

% 设金属元素 铂的升华热是分布函数F的连续型随机变量 F的中位数 θ是未知参数 现测得以下数据
% 以样本中位数M=M（x） 作为总体中位数的θ估计 试求均方误差MSE=E（（M-θ）^2）的bootstrap估计
clear
clc
a = [136.3 136.6 135.8 135.4 134.7 135.0 134.1 143.3 147.8 148.8
     134.8 135.2 134.9 149.5 141.2 135.4 134.8 135.8 135.0 133.7
     134.4 134.9 134.8 134.5 134.3 135.2 0  0 0 0];
 a = nonzeros(a);
 % b是得到各个样本的估计值
 b = bootstrp(10000, @ (x)quantile(x,0.5),a);
 % 最后是采取的相关处理操作
 c = mean((b-quantile(a,0.5)).^2);
 
 
 % problem three:
 % Bootstrap置信区间
 % 求未知数 θ的 Bootstrap置信区间的方法
 % 设 X=（X1, X2, ..., XN）是来自总体F容量为n的样本 x=（x1，x2 。。。 xn）是一个已知的样本值
 % F中含有未知数θ θ hat = θhat（X1, X2, Xn）是θ的估计量 现在求θ的置信水平为1-α
 % 相继地 独立从样本x=（x1， x2， xn）中抽出 B个容量为n 的Bootstrap样本 对于每个Bootstrap样本
 % 求出θ的Bootstrap估计 将他们从小到大排序
 % 取R（x） = θhat 
 
 % 有30窝 载猪 出生时 各窝的存活只数 为
 % 以样本均值xbar 作为总体均值μ的估计 以标准差s作为总体标准差 sigma 的估计 
 % 按分位数法 求μ以及sigma的置信水平为0.90的Bootstrap置信区间
 % 用非参数Bootstrap法 来求参数的近似置信区间的优点是 不需要对总体分布的类型做任何假设
 % 而且可以使用与小样本
 clear
 clc
 a = [9 8 10 12 11 12 7 9 11 8 9 7 7 8 9 7 9 9 10 9 9 9 12 10 10 9 13 11 13 9];
 % 返回的第一列为 均值置信区间 第二列为标准差的置信区间 第三列为中位数
 b = bootci(1000, {@ (x)[mean(x), std(x), median(x)], a},'alpha',0.1);
 
 
 % problem four：
 % 参数bootstrap方法：
 % 假设所研究的总体的分布函数 F（x；β）的形式已知，但其中包含的未知参数β，β可以是一个向量
 % 假设一个有来自F（x; β）的样本， 利用这一样本β的最大似然估计 βhat 然后利用βhat 代替β
 % 接着在F（x； βhat） 产生容量为n的样本 利用这些样本 对总体进行推断
 
 % 已知某种电子元件的寿命 服从威布尔分布 其分布函数为
 % F（x） = {  1-e(上标 -(x/η)（上标 β）)  x>0,         β，η > 0
 %              { 0,                         else
 
 % 今有样本 已知参数 β=2
 % 确定 η 的 最大似然估计  我得先有估计 代入才行
 % 对于时刻t0=50， 求可靠性 R(50) = 1-F(50) 的置信水平为0.95 的 Bootstrap单侧置信下限
 
 a = [142.84 97.04 32.46 69.14 85.67 114.43 41.76 163.07 108.22 63.28];
 % 自己写mle 不好写
 eta = sqrt(mean(a.^2));
 beta = 2;
 B = 5000;
 alpha = 0.05;
 % 产生服从 威布尔分布的随机数
 % 下面是利用估计的参数 代入产生样本 一共有B个样本 每个样本有 10个
 b = wblrnd(eta, beta, [B,10]);
 % mean(a,dim)  dim = 1  表示按列计算   dim=2 表示按行计算 得到所有行的一个均值
 % 如果 A 为矩阵，则 mean(A,2) 是包含每一行均值的列向量。
 etahat = sqrt(mean(b.^2,2));
 seta = sort(etahat);
 % 这用到了 alpha
 k = floor(B*alpha);
 k2 = floor(B*(1-alpha));
 se2 = seta(k2);
 se = seta(k);
 % 下面分别是 R（alpha） 和 R（1-alpha） 上下界
 Rt0 = exp(-(50/se)^2);
 Rt1 = exp(-(50/se2)^2);
 
 % problem five：
 % 在一个总体 中个体具有血型M MNN的概率分别是 (1-seta)^2  2θ（1-seta）   seta^2
 % 对香港地区的调查表如下
 
 % 求θ的最大似然估计
 % 求θ的置信水平为0.90的Bootstrap置信区间
 
 clear
 clc
 x = [342 500 187];
 theta = (x(2) + 2* x(2)) / (2* sum(x));
 fb = [(1-theta)^2, 2*theta*(1-theta), theta^2];
 % 求累计分布
 cf = cumsum(fb);
 % 每一列代表一个样本
 a = rand(1029,1000);
 jx1 =(a <= cf(1));
 jx2 = (a > cf(1) & a <= cf(2));
 jx3 = (a > cf(3));
 x1 = sum(jx1);
 x2 = sum(jx2);
 x3 = sum(jx3);
 theta2 = (x2 + x3*2)/ sum(x)/2;
 stheta = sort(theta2);
 qj = [stheta(50), stheta(950)]

 
 
 
 

