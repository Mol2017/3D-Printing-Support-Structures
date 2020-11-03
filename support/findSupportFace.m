function ID=findSupportFace(face,vert,Ctheta)
%找到需要支撑的面片ID
theta = cal_theta(face, vert);
theta=rad2deg(theta);
checkTheta=180-Ctheta;
Z1=theta>checkTheta;
% 取得带支撑面片的索引
ID=find(Z1==1);
end
