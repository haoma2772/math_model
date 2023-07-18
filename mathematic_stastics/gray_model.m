% page 158
% 基于灰色模型和 Bootstrap理论的大规模定制质量控制方法研究
% 至少要有八个观测值 重复取样次数B = 1000-3000
% 特点
% 样本小  而且是初期 初期 初期
% 不需要知道原始数据分布的先验特征 通过有限次的生成 可将无规则分布的任意光滑离散的原始序列 转化为有序序列
% 可保持原系统的特征，能较好地反映系统实际情况
% problem one:
% 某航空产品制造厂 生产的一批框架 根据技术指标以及 安装位置的差异性 其半径 形状 连接方式各不同
% 共有20种 且每一种产品批生产数量都不超过30件 其生产放生 可视为大规模定制模式。
% 其中一种框段 厚度要求 φ2.60(+-0.1)mm 在生产初期 采集了10件的加工数据 
% 测得的质量数据为 .......... mm根据本文的研究思路 对该零件的加工数据进行质量分析

clear
clc
% GM(1,1)
x0 = [2.5320 2.6470 2.6290 2.5840 2.6090 2.6010 2.5280 2.5630 2.6540 2.6190];
n = length(x0);
% 计算分位数 0.5
me = quantile(x0,0.5);
% 进行游程检验
% 该检验用于检验数据是否来自一个随机过程。 如果不是随机的话 要及时诊断排除故障
% h=0 表示是一个随机过程 并且p越小 p 值表示观察到的样本数据在随机过程中出现的概率。越大越来自一个随机过程
[h, p, stat] = runstest(x0, me);  % 默认是在0.05显著性水平的
% 累加序列
x1 = cumsum(x0);
% 求累加序列的 均值序列
zk = (x1(1:end-1) + x1(2:end)) / 2;
B = [-zk', ones(size(zk'))];
yn = x0(2:end)';
% 拟合参数 ab
ab = B\yn;
% 定义 数学变量
% x是函数 t是自变量
syms x(t);
% 求微分方程的符号解
x = dsolve(diff(x) + ab(1)*x == ab(2), x(0) == x0(1));
% 显示销售各式的符号解 六位
xx = vpa(x, 6);
% 求累加序列的预测值
% 下面是 把t 赋为 0-n+5 已有的对应0-n-1 时间序列嘛
yuce = subs(x, 't',[0:n+5]);
% 符号转换成数值型
yuce = double(yuce);
% 求原始数据的预测值
yuce0 = [x0(1), diff(yuce)];
% 求后验差比值
c = std(yuce0(1:n)) / std(x0);
% 提取后6个新的预测值
nyuce = yuce0(n+1:end);
% 构造新的样本数据
nyb = [x0, nyuce];
nnyb = reshape(nyb,[4,4]);
% 分别求 四个子样本的 均值 和 极差
mu = mean(nnyb);
jc = range(nnyb);
% 把数据写到 excel中 方便做表使用
xlswrite('hb.xls',[nnyb;mu;jc]);
% 产生4 行 1000列的 随机数矩阵
b = rand(4,1000);
% 把随机数映射为编号 每一列对应bootstrap样本编号
h = floor(b*length(nyb)) + 1;
bb = repmat(nyb',1,1000);
bb = bb(h); % 对新序列进行重复采样
% 计算1000个子样本的均值和 极差
mmu = mean(bb); mjc = range(bb);
% 将均值和极差 排序
smu = sort(mmu); sjc=sort(mjc);
alpha = 0.0027;
k1 = floor(1000* alpha/2); k2 = floor(1000*(1-alpha/2));
% 均值的置信区间
mqj = [smu(k1), smu(k2)];
% 极差的置信区间
jqj = [sjc(k1), sjc(k2)];

subplot(1,2,1);
plot(mu,'* -');
hold on
% 下面是两个 置信区间
plot([1,4],[mqj(1), mqj(1)])
plot([1,4],[mqj(2), mqj(2)])
ylabel('样本均值')
subplot(1,2,2);
plot(jc,'* -');
hold on
plot([1,4],[jqj(1), jqj(1)])
plot([1,4],[jqj(2), jqj(2)])
ylabel('极差')














