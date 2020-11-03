function FaceGroup=showMS(T,V,check)
%输入点、面、支撑角度
%输出 需要支撑面片群
ID = findSupportFace(T,V,check);
TR = triangulation(T,V);

%找到需要支撑的面片组FaceGroup
FaceGroup=grow1(TR,ID);

%找到不需要支撑的面片
%tmp记录需要支撑的面片；setdiff将其从总面片中移开
tmp=[];
 for i=1:length(FaceGroup)
     tmp=[tmp;T(FaceGroup{i},:)];
 end
 FaceWithoutSupport=setdiff(T,tmp,'row');
 
 %画图
 hold on
 axis equal
 mesh1=make_mesh(FaceWithoutSupport,V);
 draw_mesh(mesh1,'cyan');
  for i=1:length(FaceGroup)
      Face=FaceGroup{i};
      Face=T(Face,:);
      mesh=make_mesh(Face,V);
      draw_mesh(mesh,'red');
  end
hold off
end
