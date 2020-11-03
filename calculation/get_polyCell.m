function polyCell = get_polyCell(mesh,z)
%get cut polyCell of mesh at plane z=z
verts=mesh.vert;
faces=mesh.face;
%create cut plane
plane=make_plane(z);
polyCell = xsecmesh(plane, verts, faces, mesh);
end