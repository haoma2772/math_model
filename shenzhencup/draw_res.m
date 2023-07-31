clear
clc

% 贝塞尔曲线的控制点
control_points = [
    1000, 0;
    516,-1106;
    -3500, 0;
];

% 计算贝塞尔曲线上的点
num_points = 1000; % 贝塞尔曲线上的点数
t = linspace(0, 1, num_points)';
n = size(control_points, 1);
% curve 返回的是一个 [num_points, 2] 型的数组  列 分别是x和y
curve = bezier_curve(control_points);

% 假设障碍圆的圆心为 (0, 0)
circle_center = [0, 0];


% 判断贝塞尔曲线上的点到圆心的距离是不是超过530m
% 最小距离要求为 530 米
min_distance = 530;

% 调用函数判断是否所有点距离都大于等于 530 米
is_all_points_far = check_distance_from_circle(curve, circle_center, min_distance);

if is_all_points_far
    disp('所有点到障碍圆心的距离都不小于530米！');
else
    disp('存在距离小于530米的点！');
end

% 画图
plot(control_points(:, 1), control_points(:, 2), 'o-'); % 绘制控制点连线
hold on;
plot(curve(:, 1), curve(:, 2), 'b'); % 绘制贝塞尔曲线

% 添加近似圆
center = [0, 0];
radius = 500;
theta = linspace(0, 2*pi, 1000)';
circle_x = radius * cos(theta);
circle_y = radius * sin(theta);
plot(center(1) + circle_x, center(2) + circle_y, 'r', 'LineWidth', 1);

hold off;
title('Bezier Curve with Approximate Circle');
xlabel('X');
ylabel('Y');
legend('Control Points', 'Bezier Curve', 'Approximate Circle', 'location', 'northwest');
grid on;

time = compute_flight_time(curve)




