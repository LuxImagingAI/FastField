function [trans_mat,elfv,xg,yg,zg] = get_trans_mat(electrode,elstruct,gv,side)

%% Calculate the transformation matrix from the stamdard space to patient
% mni space

A=[electrode.head_position,1;
electrode.tail_position,1
electrode.x_position,1
electrode.y_position,1]; % points in model

B=[elstruct.markers(side).head,1;
elstruct.markers(side).tail,1;
elstruct.markers(side).x,1;
elstruct.markers(side).y,1];

Y = mldivide(A,B); Y=Y'; 
trans_mat=Y;
%% move the grid to patient mni space
[xg,yg,zg]=meshgrid(gv{1},gv{2},gv{3});

ind_mat3=zeros(1000000,3);
cnt=1;
for t=1:100
    for k=1:100
        for jj=1:100
        ind_mat3(cnt,:)=[xg(t,k,jj),yg(t,k,jj),zg(t,k,jj)];
        cnt=cnt+1;
        end
    end
end


%a=[xg(:),yg(:),zg(:)];

ind_mat4=Y*[ind_mat3,ones(size(ind_mat3,1),1)]';
ind_mat4=ind_mat4(1:3,:)';

gx1=zeros(100,100,100);
gy1=zeros(100,100,100);
gz1=zeros(100,100,100);

cnt=1;
for t=1:100
    for k=1:100
        for jj=1:100
           xg1(t,k,jj)= ind_mat4(cnt,1);
           yg1(t,k,jj)= ind_mat4(cnt,2);
           zg1(t,k,jj)= ind_mat4(cnt,3);
           cnt=cnt+1;
        end
    end
end

xg=xg1;
yg=yg1;
zg=zg1;

%% move the electrode to patient mni space
cnt=1;
for con=1:length(electrode.contacts)

    electrode.contacts(con).vertices=Y*[electrode.contacts(con).vertices,ones(size(electrode.contacts(con).vertices,1),1)]';
    electrode.contacts(con).vertices=electrode.contacts(con).vertices(1:3,:)';

    elfv(cnt).faces=electrode.contacts(con).faces;
    elfv(cnt).vertices=electrode.contacts(con).vertices;
    tissuetype(cnt)=3;
    t=surfinterior(elfv(cnt).vertices,elfv(cnt).faces);
    cnt=cnt+1;
end


for ins=1:length(electrode.insulation)

    electrode.insulation(ins).vertices=Y*[electrode.insulation(ins).vertices,ones(size(electrode.insulation(ins).vertices,1),1)]';
    electrode.insulation(ins).vertices=electrode.insulation(ins).vertices(1:3,:)';


    elfv(cnt).faces=electrode.insulation(ins).faces;
    elfv(cnt).vertices=electrode.insulation(ins).vertices;
    t=surfinterior(elfv(cnt).vertices,elfv(cnt).faces);
    cnt=cnt+1;
end

end