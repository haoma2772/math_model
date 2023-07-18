
% 这些看起来好像都是已知分布的

% 非参数检验
% 卡方 拟合优度检验
% 若总体X 是离散型的 则建立待检 假设 H0 总体X的分布律为P{X=xi} = pi
% 若总体X是连续性的 则建立 待检 假设H0： 总体X 的概率密度 为f(x)
% 1. 建立待检验假设H0： 总体X的分布函数 Fx
% 2. 在数轴上选取 k-1个 分点 t1 t2  tk-1  将数轴分成k个区间 (-∞,t1) [t1,t2) [tk-1, ∞)
% 3. 选取统计量 卡方 = sum (mi - npi)^2 / npi  如果h0 为真 则卡方~ 卡方(k-1-r)，
% 其中r为分布函数F（x） 中未知参数的个数
% 4. 对于给定的 显著性水平 alpha 确定 卡方alpha  使其满足P{卡方(k-1-r) > 卡方alpha} = alpha， 并且一句样本
% 计算统计量 卡方的观察值
% 做出判断 若 卡方 < 卡方alpha 则接受H0 否则拒绝H0
% 
%
% Problem one:
% 检查一本书 为100页 记录各页中印刷错误的个数
% alpha = 0.05  能否认为 一页的印刷错误的个数 服从泊松分布
% H0 X的分布律是 泊松分布 未知数是lanmuda

% 在 MATLAB 中，chi2gof 函数用于进行卡方拟合优度检验（Chi-Square Goodness-of-Fit Test）。
% 这个统计检验用于检验观测数据是否与某个特定理论分布拟合良好。
clear
clc
% 计算卡方统计量 卡方 与下面的卡方分位数比较 比的如果小的话 则接受
%卡方统计量 比 卡方分位数小 是应该的
% 卡方分布是离散的
n = 100;
f = 0:7;
num = [36 40 19 2 0 2 1 0];
% 各个分布的期望和 方差与 参数的关系
lanmuda = dot(f,num) / 100;
pi = poisspdf(f, lanmuda);
% 这里还指定了参数的个数 是 未知参数的个数
[h, p, st] = chi2gof(f, 'ctrs',f, 'frequency', num, 'expected', n*pi, 'nparams', 1);

% 后面是计算 卡方分布的分位数  也就是卡方alpha
% 计算第三列 pi hat
col3 = st.E/sum(st.O);
% 计算第四列 n*pi hat
col4 = st.E;
% 计算第五列 fi^2 / (n*pi hat)
col5 = st.O.^2./col4;
sumcol5 = sum(col5);
k2 = chi2inv(0.95,st.df);




% problem two：
% 从一批灯泡中 抽取300只 作为寿命实验 结果如表 
% 取alpha = 0.05
% 试检验假设H0 服从 指数分布
%       fx   =  0.005e(上标 -0.005t) t>=0 
%            =  0 , t < 0
%  注意没有未知参数的
clear
clc

% 指数分布 是连续的
% 定义边界和中心
edges = [0:100:300 inf];
bins = [50 150 250 inf];
num = [121 78 43 58];
% 定义指数分布
pd = makedist('exp',200);    % 200 是均值？
% ctrs 是分组中心 bins 用于指定分组的中心值。如果省略该参数，则 chi2gof 将使用 x 中的不同值作为分组中心。
[h, p, st] = chi2gof(bins, 'Edges', edges, 'cdf',pd,'Frequency',num);
% 第三列 
pi = st.E/sum(st.O);
% 第四列
col4 = st.E;
% 第五列
col5 = st.O.^2./col4;
sumcol5 = sum(col5);
k2 = chi2inv(0.95,st.df);

% problem three:
% 给出 200名 学生 一次数学考试的成绩 取alpha=0.1
% 检验数据 检验正态分布 N（60,15^2）
% 
clear
clc
alpha = 0.1;
edges = [-inf 20:10:100 inf];
x = [25:10:95]; % 中心
num = [5 15 30 51 60 23 10 6];
% pd = makedist('normal',60,15); 这是创建分布
% 下面这个是直接利用分布 传入x 返回的是一个结果list
pd = makedist('normal',60,15);
% 传入的参数有 x 是中心 如果是离散的话 就是自己 如果是连续的话 应该传入区间的平均值
% cdf 是分布 用makedist生成
% edges 是边界  frequency 是 f函数list
[h, p, st] = chi2gof(x,'cdf',pd,'Edges',edges,'Frequency',num);
% pi 是个区间概率 如果是连续的话  离散的话就可以是单个概率
pi = st.E/sum(st.O);
col4 = st.E;
col5 = st.O.^2./col4;
sumcol5 = sum(col5);
% chi2inv 第一个参数是 分位数alpha 第二个是 卡方多少
k2 = chi2inv(1-alpha,st.df);
% 比较 st.chi2stat 和 k2   如果是小于的话 接受


% problem four:
% 秩和检验
% 用来检验假设 h0: 两个总体X与Y 有相同的分布
% 设分别 从X Y 两总体 中独立抽取大小为 n1 和 n2的样本 设n1 <= n2
% 步骤如下：
% step1： 将两个样本混合起来 按照数值大小统一编序 每个数据对应的序数 称为秩
% step2: 计算取总体X 的样本 所对应的 秩之和 用T表示
% step3： 根据n1 n2 与水平alpha 查秩和检验表 得秩和下限T1 和 上限T2
% step4： 如果T 《= T1 或T >= T2 则否定假设H0 认为有显著差异  不然则接受 没有显著差异

% 烘干温度 为120度 现在欲将温度提高到160度 
% 为了考虑温度变化后 是否对零件抗弯强度 有明显影响 
% 今用同一涂漆工艺加工了15个零件 其中9个在120度下烘干 6个在160度下烘干 
% 试讨论 烘干温度对抗弯强度在水平alpha=0.05下 是否具有显著影响

clear
clc
alpha = 0.05;
x = [41.5 42.0 40.0 42.5 42.0 42.2 42.7 42.1 41.4];
y = [41.2 41.8 42.4 41.6 41.7 41.3];
yx = [y, x];
yxr = tiedrank(yx);
% 计算y的秩和
yr = sum(yxr(1:length(y)));
[p, h, s] = ranksum(y,x,'Alpha',alpha);


% 柯尔莫哥洛夫 检验
% 卡方拟合优度检验 实际上是 检验pi = F(ai) - F(ai-1)的正确性 并没有直接检验 Fx = F0(x) 这里分布函数必须是连续的
%  而科尔莫洛夫检验 基于经验分布函数作为检验统计量 检验理论分布函数 与 样本分布函数的拟合优度
%
alpha = 0.05;
x = [141 148 132 138 154 142 150 146 155 158
     150 140 147 148 144 150 149 145 149 158
     143 141 144 144 126 140 144 142 141 140
     145 135 147 146 141 136 140 146 142 137
     148 154 137 139 143 140 131 143 141 149
     148 135 148 152 143 144 141 143 147 146
     150 132 142 142 143 153 149 146 149 138
     142 149 142 137 134 144 146 147 140 142 
     140 137 152 145  0    0   0  0   0    0];
x = nonzeros(x);
xbar = mean(x);
s = std(x);
s2 = var(x);
% 返回是y 和 x
[yn, xn] = cdfcalc(x);
% 删掉最后一个1
yn(end) = [];
% 计算理论分布函数
y = normcdf(xn,xbar,s);
% 计算统计量的值 yn 是实际值 y是理论值
Dn = max(abs(yn - y));
% 在检验水平 0.1 下 临界值是 1.22/根号n    在0.05的水平下 临界值是1.36/根号n  在0.01水平下 临界值是1.63/根号
% 当样本计算出的Dn 值小于临界值时 说明不能拒绝 零假设 接受所假设的分布 否则拒绝
% 计算临界值
LJ = 1.36/sqrt(length(x));
pd = makedist('Normal','mu',xbar,'sigma',s);
% 调用 kstest()
[h, p, st] = kstest(x, 'CDF',pd)
% 比较LJ 和 st




















