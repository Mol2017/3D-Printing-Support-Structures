function Fs=grow1(TR,ID)
% �Դ�֧������а����˽ṹ���࣬ȥ��С��,����������
uu=1;
F=TR.ConnectivityList;
while(~isempty(ID))
    T=ID(1);
    v=F(T,:);
    E=nchoosek(v,2);
    H = edgeAttachments(TR,E);
    abc=[];
    for uuo=1:length(H)
            try
            abc=[abc;H{uuo}];
            end
        end
    H=setdiff(abc,T);
    [a,~,ib]=intersect(H,ID);
    while(~isempty(a))
        G=ID(ib);
        T=[T;G];
        IE=[];
        for i=1:length(G)
            e=F(G(i),:);
            Y=nchoosek(e,2);
            IE=[IE;Y];
        end
        E=setdiff(IE,E,'rows');
        H = edgeAttachments(TR,E);
        temm=[];
        for uuo=1:length(H)
            try
            temm=[temm;H{uuo}];
            end
        end
        H=setdiff(temm,T);
        [a,~,ib]=intersect(H,ID);   
    end
%     ȥ��С��
    if(length(T)>=3) 
        Fs{uu}=T;
        uu=uu+1;
    end
    ID=setdiff(ID,T);
end
end
