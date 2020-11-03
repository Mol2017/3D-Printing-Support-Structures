clc;clear;close;

%读取三角面片
[face,vert] = read_obj('deer.txt');

%旋转和平移
pos=[0;0;0];             %x、y、z平移量       3x1列向量
theta=[0;0;0];           %绕x、y、z转动的角度  3x1列向量
vert=T1(pos,theta,vert);
mesh=make_mesh(face, vert);
draw_mesh(mesh,'cyan')

%待支撑区域
check=20;
cla
FaceGroup=showMS(face,vert,check);

%生成支撑
[V1,T1] = findSupport(mesh,FaceGroup);
%supportmesh=make_mesh(T1,V1);

[t]=MyCrust(V1);
% profile report;profile off;
%% plot the points cloud
figure(1);
set(gcf,'position',[0,0,1280,800]);
subplot(1,2,1)
hold on
axis equal
title('Points Cloud','fontsize',14)
plot3(V1(:,1),V1(:,2),V1(:,3),'g.')
view(3);


%% plot of the output triangulation
figure(1)
subplot(1,2,2)
hold on
title('Output Triangulation','fontsize',14)
axis equal
draw_mesh(mesh,'cyan')
hold on
trisurf(t,V1(:,1),V1(:,2),V1(:,3),'facecolor','c','edgecolor','b')%plot della superficie trattata
view(3);