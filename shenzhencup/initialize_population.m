function population = initialize_population(population_size)

     % 随机生成种群中每个个体的坐标（x, y），确保 x 和 y 都大于 500
    population = 500 + 1500 * rand(population_size, 2);
end