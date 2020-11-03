function theta = cal_theta(face, vert,base_normal)
%计算每个面片的角度
    if nargin<3
        base_normal = [0;0;1];
    end
normal = cross(vert(face(:, 2), :) - vert(face(:, 1), :), ...
    vert(face(:, 3), :) - vert(face(:, 1), :));
normal = bsxfun(@rdivide,normal,sqrt(sum(normal.^2,2)));
theta = acos(normal*base_normal);%弧度制
end