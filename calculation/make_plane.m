function plane = make_plane(z)
%plane  [x0,y0,z0,vx1,vy1,vz1,vx2,vy2,vz2]
%The first 3 elements are a point on the plane. Elements 4:6 and
%7:9 each represent two different in-plane vectors.
planePoints = [
        0, 0, 0 + z, ...
        1, 0, 0 + z, ...
        0, 1, 0 + z
        ];
plane = [
        planePoints(1:3), ...
        planePoints(4:6)-planePoints(1:3), ...
        planePoints(7:9)-planePoints(1:3)
        ];
end
