function polygon = minimal_convex_polygon(points)
    % 进行 delaunay 三角剖分，将所有连接了的边保存在矩阵 lines 中
	triangles = sort(delaunay(points(1, :), points(2, :)), 2);
	lines = zeros(size(triangles, 1) * 3, 2);
	for i = 1:size(triangles, 1)
		lines(3 * i - 2,:) = [triangles(i, 1), triangles(i, 2)];
		lines(3 * i - 1,:) = [triangles(i, 1), triangles(i, 3)];
		lines(3 * i,:) = [triangles(i, 2), triangles(i, 3)];
    end
    % 去掉 lines 中出现次数超过一次的边
	[~, IA] = unique(lines, 'rows');
	lines = setdiff(lines(IA, :), lines(setdiff(1:size(lines, 1), IA), :), 'rows');
    % 跟踪 lines 中的数据点，将凸多边形的顶点编号保存在 seqs 中
	seqs = zeros(size(lines, 1) + 1,1);
	seqs(1:2) = lines(1, :);
	lines(1, :) = [];
	for i = 3:size(seqs)
		pos = find(lines == seqs(i - 1));
		row = rem(pos - 1, size(lines, 1)) + 1;
		col = ceil(pos / size(lines, 1));
		seqs(i) = lines(row, 3 - col);
		lines(row, :) = [];
    end
    % 根据 seqs ， 得到凸多边形顶点坐标
	polygon = points(:, seqs);
end