
function plot_efield(Efield,xg,yg,zg,perc,elfv,dir_estimefield,target,side)

%% visualize Efield

min_e=min(min(min(Efield)));
max_e=max(max(max(Efield)));

range_e=max_e-min_e;
step_e=range_e/50;

%E_layers = min_e:step_e:max_e;
E_layers = min_e:step_e:max_e;
Ds = 3;
cut = 1:100;

data = Efield(:,:,cut);
X=xg;
Y=yg;
Z=zg;
cmap = lines(length(E_layers));
h = {};
legendStr = {};


figure;
 for i = 1:length(E_layers)

    s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), permute(data, [2 1 3]) > E_layers(i) );
    
    h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:), 'FaceAlpha', 0.1);
    legendStr{end+1} = ['PW = ' num2str(E_layers(i)) ' Diameter = ' num2str(Ds) ];
    
    daspect([1 1 1])
    lighting gouraud
 end

 %% visualize Electrode
perc(9)=0;
 hold on;
for i=1:length(elfv)
    if(ismember(i, [1 2 3 4 5 6 7 8 9]))
        if perc(i)>0
            
           patch(elfv(i), 'FaceColor', 'red', 'EdgeColor', 'none');
        else
           patch(elfv(i), 'FaceColor', rgb('dimgray'), 'EdgeColor', 'none');
        end
    else
       patch(elfv(i), 'FaceColor', rgb('lightgray'), 'EdgeColor', 'none');

    end
end
daspect([1 1 1])
 camlight left;

 
 %% visualize Target

load([dir_estimefield filesep 'atlas_index.mat']);

if strcmp(target,'stn')
    hold on;
    if side == 1
        patch(atlases.fv{1,1}, 'FaceColor', [0 0.9 0.7], 'EdgeColor', 'none')
       elseif side == 2
           patch(atlases.fv{1,2}, 'FaceColor', [0 0.9 0.7], 'EdgeColor', 'none')
    end
elseif strcmp(target,'vim')
      hold on;
        if side == 1
            patch(atlases.fv{5,1}, 'FaceColor', [0 0.7 1], 'EdgeColor', 'none')
       elseif side == 2
           patch(atlases.fv{5,2}, 'FaceColor', [0 0.7 1], 'EdgeColor', 'none')
        end
else strcmp(target,'')
    
end
daspect([1 1 1])
addToolbarExplorationButtons(gcf)

end
