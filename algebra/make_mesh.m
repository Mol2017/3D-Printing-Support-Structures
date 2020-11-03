function mesh = make_mesh(face, vert)

[edge,eif,adjacency_matrix] = compute_edge(face);
[he,heif] = compute_halfedge(face);

nf = size(face,1);
nv = size(vert,1);
ne = size(edge,1);
nh = size(he,1);

mesh.nf = nf;
mesh.nv = nv;
mesh.ne = ne;
mesh.nh = nh;

mesh.face = face;
mesh.vert = vert;
mesh.edge = edge;
mesh.eif = eif;
mesh.halfedge = he;
mesh.heif = heif;
mesh.adjacency_matrix = adjacency_matrix;

% bd is unordered, mainly used to test if vert is on boundary
ind = eif(:,1)>0 & eif(:,2)>0;
bde = edge(~ind,:);
mesh.bd = unique(bde(:));
