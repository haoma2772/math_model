function mutated_population = mutate(offspring_population, mutation_rate)
    % 变异操作
    num_individuals = size(offspring_population, 1);
    num_mutations = ceil(num_individuals * size(offspring_population, 2) * mutation_rate);
    mutated_population = offspring_population;
    
    for i = 1:num_mutations
        % 随机选择一个个体进行变异
        idx = randi(num_individuals);
        
        % 随机选择变异点
        mutation_point = randi(2);
        
        % 在[-5000, 5000]范围内生成新的坐标值
        mutated_population(idx, mutation_point) = -5000 + 10000 * rand();
    end
end