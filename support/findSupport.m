function [supportVert,supportFace] = findSupport(mesh,FaceGroup)
%生成支撑的点和面
face=mesh.face;
vert=mesh.vert;
zmax=max(vert(:,3));
zmin=min(vert(:,3));
baseplane=zmin-(zmax-zmin)/100;

%生成点云
TR=triangulation(face,vert);
SupportPointCloud=formSupport(FaceGroup,TR,baseplane);
n=length(SupportPointCloud);
supportFace=[];
supportVert=[];
for i=1:n 
    P1=SupportPointCloud{i};
    index=size(supportVert,1);
    supportVert=[supportVert;P1];
    F1=MyCrust(P1)+index;
    supportFace=[supportFace;F1];

end

end
