clc;clear;close;
%读取三角面片
[face,vert] = read_obj('tree.txt');

%旋转和平移
pos=[0;0;0];             %x、y、z平移量       3x1列向量
theta=[0;0;0];           %绕x、y、z转动的角度  3x1列向量
vert=T1(pos,theta,vert);
zmax=max(vert(:,3));      %z最大值
zmin=min(vert(:,3));      %z最小值

%生成半边数据
mesh=make_mesh(face,vert);

%生成支撑的点与面文件
%phi=60;                  %选择与地面成phi度的面片生成支撑
%[supportVert,supportFace] = findSupport(mesh,phi);
%supportmesh=make_mesh(supportFace,supportVert);

%设置截面的高度（百分比形式）和对应的plane参数
%percent=110;
%z=zmin+(zmax-zmin)*percent/100;
z=8.935;
plane=make_plane(z); %create cut plane

% Get the plane/mesh cross-section.
[polyCell,nbrFaces] = xsecmesh(plane, mesh);
%supportPolyCell = xsecmesh(plane, supportmesh);

%计算打印件截面积和周长（不包括支撑）
%Area = compute_area(polyCell);
%Perimeter = compute_perimeter(polyCell);

%plot the plane/mesh cross-section.
%draw_mesh_and_cut1(mesh,supportmesh,polyCell,supportPolyCell,z);