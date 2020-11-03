clc;clear;close;

%��ȡ������Ƭ
[face,vert] = read_obj('deer.txt');

%��ת��ƽ��
pos=[0;0;0];             %x��y��zƽ����       3x1������
theta=[0;0;0];           %��x��y��zת���ĽǶ�  3x1������
vert=T1(pos,theta,vert);
mesh=make_mesh(face, vert);
draw_mesh(mesh,'cyan')

%��֧������
check=20;
cla
FaceGroup=showMS(face,vert,check);

%����֧��
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