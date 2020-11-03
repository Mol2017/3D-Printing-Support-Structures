function draw_mesh(mesh,color)
verts=mesh.vert;
faces=mesh.face;

h = patch('vertices', verts, 'faces', faces);
    set(                                                ...
        h          ,                           ...
        'FaceColor'         ,   color       ,   ...% 'none'代表透明
        'EdgeColor'         ,   'none'            ,   ...
        'FaceLighting'      ,   'phong'      ,   ...
        'AmbientStrength'   ,   0.7           ,   ...
        'LineWidth'         ,   1              ,   ...
        'FaceAlpha'         ,   1               ...%透明度
        );
grid on;
hold off;
xlabel 'x';ylabel 'y';zlabel 'z';
axis equal;
view(-105,15);
%光照
lighting phong;
material dull;
% camlight('headlight');
%L1=light('position',[-2 1 -2],'style','infinite');
%L2=light('position',[-2 1 3],'style','local');
set(gcf,'Color','w');%设置整个figure的背景颜色('w',白色)
end