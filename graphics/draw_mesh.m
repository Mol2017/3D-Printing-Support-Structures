function draw_mesh(mesh,color)
verts=mesh.vert;
faces=mesh.face;

h = patch('vertices', verts, 'faces', faces);
    set(                                                ...
        h          ,                           ...
        'FaceColor'         ,   color       ,   ...% 'none'����͸��
        'EdgeColor'         ,   'none'            ,   ...
        'FaceLighting'      ,   'phong'      ,   ...
        'AmbientStrength'   ,   0.7           ,   ...
        'LineWidth'         ,   1              ,   ...
        'FaceAlpha'         ,   1               ...%͸����
        );
grid on;
hold off;
xlabel 'x';ylabel 'y';zlabel 'z';
axis equal;
view(-105,15);
%����
lighting phong;
material dull;
% camlight('headlight');
%L1=light('position',[-2 1 -2],'style','infinite');
%L2=light('position',[-2 1 3],'style','local');
set(gcf,'Color','w');%��������figure�ı�����ɫ('w',��ɫ)
end