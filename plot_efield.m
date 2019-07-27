
function plot_efield(Efield,xg,yg,zg,perc,elfv,dir_estimefield,target,side)
ea_dispt('Plot the Efield ...')
%% visualize Efield

min_e=min(Efield(:));
max_e=max(Efield(:));

range_e=max_e-min_e;
step_e=range_e/63;

%min_e=200;
E_layers = min_e:step_e:max_e;
cut = 1:100;

data = Efield(:,:,cut);
X=xg;
Y=yg;
Z=zg;
%cmap = lines(length(E_layers));
cmap = colormap(autumn);
h = {};


figure;
 for i = 1:length(E_layers)
     
     if E_layers(i) >200
         
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), permute(data, [2 1 3]) > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:) , 'FaceAlpha', 0.1);

        daspect([1 1 1])
        lighting gouraud
         
     else
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), permute(data, [2 1 3]) > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:), 'FaceAlpha', 0.07);

        daspect([1 1 1])
        lighting gouraud
      end
end
 %% visualize Electrode
perc(9)=0;
 hold on;
for i=1:length(elfv)
    if(ismember(i, [1 2 3 4 5 6 7 8 9]))
        if perc(i)>0
            
           patch(elfv(i), 'FaceColor', [1 0.1 0.1] , 'EdgeColor', 'none');
        else
           patch(elfv(i), 'FaceColor', rgb('dimgray'), 'EdgeColor', 'none');
        end
    else
        patch(elfv(i), 'FaceColor', rgb('lightgray'), 'EdgeColor', 'none');

    end
end
daspect([1 1 1])
camlight left;
lighting gouraud

 
 %% visualize Target

load([dir_estimefield filesep 'resources' filesep 'atlas_index.mat']);

if strcmp(target,'stn')
    hold on;
    if side == 1
            patch(atlases.fv{1,1}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
            lighting gouraud
       elseif side == 2
            patch(atlases.fv{1,2}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
            lighting gouraud
    end
elseif strcmp(target,'vim')
      hold on;
        if side == 1
            patch(atlases.fv{5,1}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
            lighting gouraud
            
       elseif side == 2
            patch(atlases.fv{5,2}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
            lighting gouraud
        end
%else strcmp(target,'')
    
end
daspect([1 1 1]);
addToolbarExplorationButtons(gcf);
ea_dispt('');
set(gca,'color',[0.9 0.9 0.9]);
% axis off
set(gca,'XTick',[]);
set(gca,'Xcolor',[0.9 0.9 0.9])
set(gca,'YTick',[]);
set(gca,'Ycolor',[0.9 0.9 0.9])
set(gca,'ZTick',[]);
set(gca,'Zcolor',[0.9 0.9 0.9])
title('Estimated Efield');
end
