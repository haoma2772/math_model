function curve = bezier_curve(control_points)
  
    num_points = 10000;
    % t是biser_curve 中的t 是0,1 均匀分布
    t = linspace(0, 1, num_points)';
    n = size(control_points, 1);

    curve = zeros(num_points, 2);

    for i = 1:num_points
        coefficients = zeros(n, 1);
        for j = 0:n-1
            % 计算组合数 C(n-1, j)
            combination = factorial(n-1) / (factorial(j) * factorial(n-1-j));
            coefficients(j+1) = combination * t(i)^j * (1 - t(i))^(n-1-j);
        end
        curve(i, :) = sum(control_points .* coefficients, 1);
    end
end
