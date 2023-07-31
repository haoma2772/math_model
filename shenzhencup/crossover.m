function offspring_population = crossover(selected_population, crossover_rate)
    % 交叉操作（单点交叉）
    num_individuals = size(selected_population, 1);
    num_crossovers = ceil(num_individuals * crossover_rate / 2);
    offspring_population = selected_population;
    
    for i = 1:num_crossovers
        % 随机选择两个个体进行交叉
        idx1 = randi(num_individuals);
        idx2 = randi(num_individuals);
        
        if idx1 == idx2
            continue; % 避免选择同一个个体
        end
        
        % 随机选择交叉点
        crossover_point = randi(2);
        
        % 交叉
        offspring_population(idx1, crossover_point:end) = selected_population(idx2, crossover_point:end);
        offspring_population(idx2, crossover_point:end) = selected_population(idx1, crossover_point:end);
    end
end