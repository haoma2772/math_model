function selected_population = select_individuals(population, fitness_values)
    % 根据适应度值选择优秀个体（锦标赛选择）
    tournament_size = 5; % 锦标赛大小
    num_individuals = size(population, 1);
    selected_population = zeros(num_individuals, 2);
    
    for i = 1:num_individuals
        % 随机选择锦标赛的个体
        tournament_idx = randperm(num_individuals, tournament_size);
        tournament_fitness = fitness_values(tournament_idx);
        
        % 选择锦标赛中适应度最好的个体
        [~, best_idx] = max(tournament_fitness);
        selected_population(i, :) = population(tournament_idx(best_idx), :);
    end
end