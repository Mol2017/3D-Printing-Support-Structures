clc;clear;close;
%��ȡ������Ƭ
[face,vert] = read_obj('tree.txt');

%����ģ�Ͱ������
mesh=make_mesh(face,vert);

%����֧�Ű������
check=30;
FaceGroup=showMS(face,vert,check);
[supportVert,supportFace] = findSupport(mesh,FaceGroup);
supportmesh=make_mesh(supportFace,supportVert);

%���ɽ���
z=0.3;
plane=make_plane(z); %create cut plane

%�õ�ģ����֧�Ž���ĵ�
polyCell = xsecmesh(plane, mesh);
supportPolyCell = xsecmesh(plane, supportmesh);

%% ��Ҫ���֣���ͼ��ʹ�õ��޸Ĺ���draw_mesh_and_cut�Լ�myCrust����ȱ������
cla;
camlight 'headlight';
draw_mesh_and_cut(mesh,supportmesh,polyCell,supportPolyCell,z);

%�������Լ�д���Ǹ��������ã�������ȱ��
%[polyCell nbrFaces intPts] = xsecmesh(plane, mesh);%�Լ�д���Ǹ�

%new_mesh=mesh_cut_new(polyCell,nbrFaces,intPts,mesh,z);
%draw_cut(polyCell,z);
