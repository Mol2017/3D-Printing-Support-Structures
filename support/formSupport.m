function F=formSupport(FaceGroup,TR,base)
% ����֧�ŵĵ���
shp = alphaShape(TR.Points);
a = criticalAlpha(shp,'all-points');
shp = alphaShape(TR.Points,0.1*a);
%����һ��֧�ŵ���������չ�ĸ߶�h
h=(max(TR.Points(:,3))-min(TR.Points(:,3)))/100;

%�ҵ�ÿ��FaceGroup�ı߽�ĵ�
for i=1:max(length(FaceGroup))
    Group=FaceGroup{i};
    Face=TR.ConnectivityList(Group,:);
    %�߽��ϵĵ�
    bd{i}=compute_bd(Face);
    %�߽��ڵĵ�
    insides{i}=setdiff(Face(:),bd{i});
end

%ÿһ���߽绷�������ɵ���
for i=1:length(bd)
    bdGroup=bd(i);
    %FF������¼ÿ�����ı߽��������ɵĵ���
    FF=[];
    supportStartPoints=TR.Points(bdGroup{1,1},:);
    
    for j=1:size(supportStartPoints,1)
        %group��ÿһ����
        tmp=supportStartPoints(j,:);
        %pointCloud������¼ÿ�����������ɵ�
        pointCloud=tmp;
        %�ж��ཻ����ֹ����
        count=0;
        while(1)
            %�ƴ�
            count=count+1;
            %��ǰ��
            pointNow=tmp;
            %��ǰ������h���ɵĵ�
            tmp(3)=tmp(3)-h;
            pointNext=tmp;
            %if count==1
                %�ж��ܲ�����������3��
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

%ÿһ���߽��ڲ��ĵ�����Ѱ�ҵ��Ƶ���ֹ��
for i=1:length(insides)
    insidesGroup=insides(i);
    %FFinsides������¼ÿ�������ڲ��ĵ����ֹ��
    FFinsides=[];
    supportStartPoints=TR.Points(insidesGroup{1,1},:);
    
    for j=1:size(supportStartPoints,1)
        %group��ÿһ����
        tmp=supportStartPoints(j,:);
        %pointCloud������¼ÿ�����������ɵ�
        pointCloud=tmp;
        %�ж��ཻ����ֹ����
        count=0;
        while(1)
            %�ƴ�
            count=count+1;
            %��ǰ��
            pointNow=tmp;
            %��ǰ������h���ɵĵ�
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


