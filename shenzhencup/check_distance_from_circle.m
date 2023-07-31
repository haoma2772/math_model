function is_all_points_far = check_distance_from_circle(curve, circle_center, min_distance)
    % curve: 贝塞尔曲线上的点坐标，大小为(num_points, 2)
    % circle_center: 障碍圆的圆心坐标，格式为[x, y]
    % min_distance: 最小距离要求，单位为米
    
    % 计算曲线上的点到障碍圆心的距离
    distances = sqrt((curve(:, 1) - circle_center(1)).^2 + (curve(:, 2) - circle_center(2)).^2);
    
    % 判断距离是否大于等于 min_distance
    is_all_points_far = all(distances >= min_distance);
end
