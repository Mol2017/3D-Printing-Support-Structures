clc;clear;close;
%读取三角面片
[face,vert] = read_obj('tree.txt');

%生成模型半边数据
mesh=make_mesh(face,vert);

%生成支撑半边数据
check=30;
FaceGroup=showMS(face,vert,check);
[supportVert,supportFace] = findSupport(mesh,FaceGroup);
supportmesh=make_mesh(supportFace,supportVert);

%生成截面
z=0.3;
plane=make_plane(z); %create cut plane

%得到模型与支撑截面的点
polyCell = xsecmesh(plane, mesh);
supportPolyCell = xsecmesh(plane, supportmesh);

%% 主要部分：画图，使用的修改过的draw_mesh_and_cut以及myCrust，无缺口现象
cla;
camlight 'headlight';
draw_mesh_and_cut(mesh,supportmesh,polyCell,supportPolyCell,z);

%下面是自己写的那个，不好用，还是有缺口
%[polyCell nbrFaces intPts] = xsecmesh(plane, mesh);%自己写的那个

%new_mesh=mesh_cut_new(polyCell,nbrFaces,intPts,mesh,z);
%draw_cut(polyCell,z);
