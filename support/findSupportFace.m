function ID=findSupportFace(face,vert,Ctheta)
%�ҵ���Ҫ֧�ŵ���ƬID
theta = cal_theta(face, vert);
theta=rad2deg(theta);
checkTheta=180-Ctheta;
Z1=theta>checkTheta;
% ȡ�ô�֧����Ƭ������
ID=find(Z1==1);
end
