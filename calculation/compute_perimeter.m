function allPermt = compute_perimeter(polyCell)
%use the function "get_polyCell" to get the polyCell
allPermt = 0;
for i=1:numel(polyCell)
    polyin=polyshape(polyCell{i}(:,1:2));
    allPermt=allPermt+perimeter(polyin);
end
end