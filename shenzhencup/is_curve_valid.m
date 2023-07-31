function is_valid = is_curve_valid(curve, obstacle_center, obstacle_radius, min_turning_radius)
    % 判断曲线是否与障碍圆相交，并且满足最小转弯半径要求
    is_valid = true;
    
    for i = 1:size(curve, 1)
        point = curve(i, :);
        distance_to_obstacle = norm(point - obstacle_center);
        
        if distance_to_obstacle <= obstacle_radius + min_turning_radius
            is_valid = false;
            break;
        end
    end
end