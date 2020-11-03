function T=rot1x(theta)
theta=deg2rad(theta);
T=[1,0,0;0,cos(theta),-sin(theta);0,sin(theta),cos(theta)];
end
