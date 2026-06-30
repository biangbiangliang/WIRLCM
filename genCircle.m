function mask = genCircle(radius)
    mask_size = 2 * radius + 1;
    [r, c] = meshgrid(1 : mask_size);           % 获取掩膜的坐标信息
    center = (radius + 1) * ones(mask_size, mask_size);
    mask_temp = round(sqrt((r - center).^2 + (c - center).^2));    % 获取像素点到中心位置的距离信息
  
%     mask1 = mask_temp <= radius;
%     mask = mask1/sum(sum(mask1));
    
%     mask1 = mask_temp <= radius;
%     mask2 = mask_temp > radius - 1;
%     mask = (mask1.*mask2);

%     mask = mask_temp == radius;
    mask = (max(mask_temp - 1.1, 0) < radius) .* (max(mask_temp - 1.1, 0) > 1.1);
%     mask = mask/sum(sum(mask));

end
