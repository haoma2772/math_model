clear
clc

A = [1000,0];
B = [-3500, 0];
obstacle_center = [0,0];
obstacle_radius = 500;
min_turning_radius = 30;
s = '算法开始'
[best_path, best_time] = optimize_flight_path(A, B, obstacle_center, obstacle_radius, min_turning_radius)

s = '算法结束'
