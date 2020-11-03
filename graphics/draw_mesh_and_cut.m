function draw_mesh_and_cut(mesh,meshSup,polyCell,polyCellSup,z)
%�������漰�������µ�mesh��meshSup
verts=mesh.vert;
faces=mesh.face;
vertsSup=meshSup.vert;
facesSup=meshSup.face;

%hide the upper section of the mesh
newVerts=[];
for i=1:length(verts)
    if verts(i,3)<z
        newVerts=[newVerts;verts(i,:)];
    end
end

newVertsSup=[];
for i=1:length(vertsSup)
    if vertsSup(i,3)<z
        newVertsSup=[newVertsSup;vertsSup(i,:)];
    end
end

crossPoints=[];
for i=1:numel(polyCell)
    crossPoints=[crossPoints; polyCell{i}];
end

crossPointsSup=[];
for i=1:numel(polyCellSup)
    crossPointsSup=[crossPointsSup; polyCellSup{i}];
end

newVerts=[newVerts;crossPoints];
[newFaces]=MyCrust(newVerts);

newVertsSup=[newVertsSup;crossPointsSup];
[newFacesSup]=MyCrust(newVertsSup);

%plot the mesh
%hs1 = subplot(1,2,1);
    %plot the down section of the mesh
    h = patch('vertices', newVerts, 'faces', newFaces);
    set(                                                ...
        h          ,                           ...
        'FaceColor'         ,   'cyan'       ,   ...% 'none'����͸��
        'EdgeColor'         ,   'none'            ,   ...
        'FaceLighting'      ,   'phong'      ,   ...
        'AmbientStrength'   ,   0.7           ,   ...
        'LineWidth'         ,   1              ,   ...
        'FaceAlpha'         ,   1               ...%͸����
        );
    grid on;
    hold on;
    
    %֧�ŵ�ģ��
    hSup = patch('vertices', newVertsSup, 'faces', newFacesSup);
    set(                                                ...
        hSup          ,                           ...
        'FaceColor'         ,   [0.5 0.5 0.5]       ,   ...% 'none'����͸��
        'EdgeColor'         ,   'none'            ,   ...
        'FaceLighting'      ,   'phong'      ,   ...
        'AmbientStrength'   ,   0.7           ,   ...
        'LineWidth'         ,   1              ,   ...
        'FaceAlpha'         ,   1               ...%͸����
        );
    grid on;
    hold on;

    %plot the cut graph
    for numPoly = 1:numel(polyCell)
        hold on
        hCut = patch(                  ...
            polyCell{numPoly}(:,1), ...
            polyCell{numPoly}(:,2), ...
            polyCell{numPoly}(:,3), 'cyan');
        set(                            ...
            hCut                  ,   ...
            'FaceColor' ,   'k'   ,   ...
            'EdgeColor' ,   'r'     ,   ...
            'LineWidth' ,   0.5       ,   ...
            'FaceAlpha' ,   1         ... %͸����
            );
    end
    hold on;
    
    %֧�ŵĽ���
    for numPoly = 1:numel(polyCellSup)
        hold on
        hCutSup = patch(                  ...
            polyCellSup{numPoly}(:,1), ...
            polyCellSup{numPoly}(:,2), ...
            polyCellSup{numPoly}(:,3), 'cyan');
        set(                            ...
            hCutSup                  ,   ...
            'FaceColor' ,   'k'   ,   ...
            'EdgeColor' ,   'r'     ,   ...
            'LineWidth' ,   0.5       ,   ...
            'FaceAlpha' ,   1         ... %͸����
            );
    end
    
    xlabel 'x';ylabel 'y';zlabel 'z';
    axis equal;
    view(-105,15);
    %set(hs1,'View',[-105,15]);
    
    %����
    lighting phong;
    material dull;
    %camlight('headlight');
    %L1=light('position',[-2 1 -2],'style','infinite');
    %L2=light('position',[-2 1 3],'style','local');
    
    %(gca,'XTickLabel',[],'YTickLabel',[],'ZTickLabel',[]);%����������
     
set(gcf,'Color','w');%��������figure�ı�����ɫ('w',��ɫ)
end

