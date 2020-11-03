function FaceGroup=showMS(T,V,check)
%����㡢�桢֧�ŽǶ�
%��� ��Ҫ֧����ƬȺ
ID = findSupportFace(T,V,check);
TR = triangulation(T,V);

%�ҵ���Ҫ֧�ŵ���Ƭ��FaceGroup
FaceGroup=grow1(TR,ID);

%�ҵ�����Ҫ֧�ŵ���Ƭ
%tmp��¼��Ҫ֧�ŵ���Ƭ��setdiff���������Ƭ���ƿ�
tmp=[];
 for i=1:length(FaceGroup)
     tmp=[tmp;T(FaceGroup{i},:)];
 end
 FaceWithoutSupport=setdiff(T,tmp,'row');
 
 %��ͼ
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
