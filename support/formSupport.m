function F=formSupport(FaceGroup,TR,base)
% 生成支撑的点云
shp = alphaShape(TR.Points);
a = criticalAlpha(shp,'all-points');
shp = alphaShape(TR.Points,0.1*a);
%设置一个支撑点云向下延展的高度h
h=(max(TR.Points(:,3))-min(TR.Points(:,3)))/100;

%找到每个FaceGroup的边界的点
for i=1:max(length(FaceGroup))
    Group=FaceGroup{i};
    Face=TR.ConnectivityList(Group,:);
    %边界上的点
    bd{i}=compute_bd(Face);
    %边界内的点
    insides{i}=setdiff(Face(:),bd{i});
end

%每一个边界环向下生成点云
for i=1:length(bd)
    bdGroup=bd(i);
    %FF用来记录每个环的边界向下生成的点云
    FF=[];
    supportStartPoints=TR.Points(bdGroup{1,1},:);
    
    for j=1:size(supportStartPoints,1)
        %group里每一个点
        tmp=supportStartPoints(j,:);
        %pointCloud用来记录每个点向下生成的
        pointCloud=tmp;
        %判断相交及终止条件
        count=0;
        while(1)
            %计次
            count=count+1;
            %当前点
            pointNow=tmp;
            %当前点向下h生成的点
            tmp(3)=tmp(3)-h;
            pointNext=tmp;
            %if count==1
                %判断能不能向下生成3步
                %pointCheck=pointNow;
                %pointCheck(3)=pointCheck(3)-5*h;
                %if abs(inShape(shp,pointNow)-inShape(shp, pointCheck))==0
                    %pointCloud=[];
                    %break
                %end
            if count>1 && (abs(inShape(shp,pointNow)-inShape(shp, pointNext))==1)
                break;
            elseif tmp(3)<base
                tmp(3)=base;
                pointCloud=[pointCloud;tmp];
                break;
            else
                pointCloud=[pointCloud;tmp];
            end          
        end
        FF=[FF;pointCloud];
    end
    F{i}=FF;
end

%每一个边界内部的点向下寻找点云的中止点
for i=1:length(insides)
    insidesGroup=insides(i);
    %FFinsides用来记录每个环的内部的点和中止点
    FFinsides=[];
    supportStartPoints=TR.Points(insidesGroup{1,1},:);
    
    for j=1:size(supportStartPoints,1)
        %group里每一个点
        tmp=supportStartPoints(j,:);
        %pointCloud用来记录每个点向下生成的
        pointCloud=tmp;
        %判断相交及终止条件
        count=0;
        while(1)
            %计次
            count=count+1;
            %当前点
            pointNow=tmp;
            %当前点向下h生成的点
            tmp(3)=tmp(3)-h;
            pointNext=tmp;        
            if count>1 && (abs(inShape(shp,pointNow)-inShape(shp, pointNext))==1)
                pointCloud=[pointCloud;pointNext];
                break;     
            elseif tmp(3)<base
                tmp(3)=base;
                pointCloud=[pointCloud;tmp];
                break;
            else
                pointCloud=[pointCloud;tmp];
            end          
        end
        FFinsides=[FFinsides;pointCloud];
    end
    F{1,i}=[F{1,i};FFinsides];
end


