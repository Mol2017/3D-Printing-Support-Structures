clc;clear;close;
%��ȡ������Ƭ
[face,vert] = read_obj('tree.txt');

%��ת��ƽ��
pos=[0;0;0];             %x��y��zƽ����       3x1������
theta=[0;0;0];           %��x��y��zת���ĽǶ�  3x1������
vert=T1(pos,theta,vert);
zmax=max(vert(:,3));      %z���ֵ
zmin=min(vert(:,3));      %z��Сֵ

%���ɰ������
mesh=make_mesh(face,vert);

%����֧�ŵĵ������ļ�
%phi=60;                  %ѡ��������phi�ȵ���Ƭ����֧��
%[supportVert,supportFace] = findSupport(mesh,phi);
%supportmesh=make_mesh(supportFace,supportVert);

%���ý���ĸ߶ȣ��ٷֱ���ʽ���Ͷ�Ӧ��plane����
%percent=110;
%z=zmin+(zmax-zmin)*percent/100;
z=8.935;
plane=make_plane(z); %create cut plane

% Get the plane/mesh cross-section.
[polyCell,nbrFaces] = xsecmesh(plane, mesh);
%supportPolyCell = xsecmesh(plane, supportmesh);

%�����ӡ����������ܳ���������֧�ţ�
%Area = compute_area(polyCell);
%Perimeter = compute_perimeter(polyCell);

%plot the plane/mesh cross-section.
%draw_mesh_and_cut1(mesh,supportmesh,polyCell,supportPolyCell,z);