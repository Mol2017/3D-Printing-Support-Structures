function T=rot1z(theta)
theta=deg2rad(theta);
T=[cos(theta),-sin(theta),0;sin(theta),cos(theta),0;0,0,1];
end
