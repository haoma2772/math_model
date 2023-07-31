function time = compute_flight_time(curve)
    % 假设飞行速度为10 m/s，计算曲线上的点之间的距离
    % diff 是计算每行之间的 然后得出 是一个二维向量 但是需要转置一下求二范数
    tmp = diff(curve);
    tmp = tmp';
    distances = vecnorm(tmp);
    
    % 计算飞行时间
    time = sum(distances) / 10;
end