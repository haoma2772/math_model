function fitness_values = compute_fitness(population, A, B, obstacle_center, obstacle_radius, min_turning_radius)
    
    % 种群 就是自变量的集合
    num_individuals = size(population, 1);
    fitness_values = zeros(num_individuals, 1);
    
    for i = 1:num_individuals
       % 用 A、B 和当前个体构建贝塞尔曲线
        C = population(i, :);
        control_points = [A; C; B];
        
        % 计算曲线上的点
        curve = bezier_curve(control_points);
        
          
        % 判断曲线是否与障碍圆相交，并且满足最小转弯半径要求
        if is_curve_valid(curve, obstacle_center, obstacle_radius, min_turning_radius)
            % 计算两架无人机的飞行时间
            % 将fitness 置为 时间的倒数 时间越短越好
            fitness_values(i) = 1 / compute_flight_time(curve);
        else
            % 无效路径，适应度设为0
            fitness_values(i) = 0;
        end
    end
end
