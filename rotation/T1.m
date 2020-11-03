function npos=T1(pos,theta,B)
% 坐标变换，角度制
R=rot1x(theta(1))*rot1y(theta(2))*rot1z(theta(3));
npos=B;
h=size(B);
for i=1:h(1)
npos(i,1:3)=R*B(i,1:3)'+pos;   
end
end
