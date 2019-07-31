
<<<<<<< HEAD
if strcmp(plot_choice,'vta_efield')
    
%ea_dispt('plot Efield...')
=======
function [hGroupField, hGroupElec, hTarget] = plot_efield(Efield,xg,yg,zg,perc,elfv,atlases,target,side)
ea_dispt('Plot the Efield ...')

>>>>>>> 231393e41feb99feb3ec0d93596c7d6cd8351aab
% visualize Efield
min_e=min(Efield(:));
max_e=max(Efield(:));

range_e=max_e-min_e;
step_e=range_e/63;

E_layers = min_e:step_e:max_e;
E_layers = 0.2 * 1000; % general heuristics
cut = 1:100;

data = Efield(:,:,cut);
X=xg;
Y=yg;
Z=zg;

cmap = colormap(autumn);
hGroupField = hggroup();
h = {};


 for i = 1:length(E_layers)
     
     if E_layers(i) >200
         
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:) , 'FaceAlpha', 0.1, 'Parent', hGroupField);
         
     else
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:), 'FaceAlpha', 0.07, 'Parent', hGroupField);

      end
 end
<<<<<<< HEAD
 
 ea_dispt('')
 
elseif strcmp(plot_choice,'vta')
 %   ea_dispt('plot vta...')
% visualize Efield

E_layers = 200;
cut = 1:100;

data = Efield(:,:,cut);
X=xg;
Y=yg;
Z=zg;

cmap = colormap(autumn);
hGroupField = hggroup();
h = {};


        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > E_layers );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(1,:) , 'FaceAlpha', 0.25, 'Parent', hGroupField);
         
 
 %ea_dispt('')
 
=======

% visualize Electrode
hGroupElec = hggroup();

perc(9)=0;
hold on;
for i=1:length(elfv)
    if(ismember(i, [1 2 3 4 5 6 7 8 9]))
        if perc(i)>0
           patch(elfv(i), 'FaceColor', rgb('gold') , 'EdgeColor', 'none', 'Parent', hGroupElec);
        else
           patch(elfv(i), 'FaceColor', rgb('dimgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
        end
    else
        patch(elfv(i), 'FaceColor', rgb('lightgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
    end
end

>>>>>>> 231393e41feb99feb3ec0d93596c7d6cd8351aab
 
% visualize Target

hTarget  = [];
if strcmp(target,'stn')
    hold on;
    if side == 1
            hTarget = patch(atlases.fv{1,1}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
       elseif side == 2
            hTarget = patch(atlases.fv{1,2}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
    end
elseif strcmp(target,'vim')
      hold on;
        if side == 1
            hTarget = patch(atlases.fv{5,1}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
            
       elseif side == 2
            hTarget = patch(atlases.fv{5,2}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.5)
            material dull
        end
    
end
camlight left;
lighting gouraud
daspect([1 1 1]);
addToolbarExplorationButtons(gcf);
ea_dispt('');
set(gca,'color',[0.9 0.9 0.9]);
set(gca,'XTick',[]);
set(gca,'Xcolor',[0.9 0.9 0.9])
set(gca,'YTick',[]);
set(gca,'Ycolor',[0.9 0.9 0.9])
set(gca,'ZTick',[]);
set(gca,'Zcolor',[0.9 0.9 0.9])
title('Estimated Efield');
end
