function allArea = compute_area(polyCell)
%use the function "get_polyCell" to get the polyCell
allArea = 0;
for i=1:numel(polyCell)
    polyin=polyshape(polyCell{i}(:,1:2));
    allArea=allArea+area(polyin);
end
end