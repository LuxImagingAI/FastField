function [hGroupField] = plot_efield(Efield,xg,yg,zg,plot_choice)

if strcmp(plot_choice,'vta_efield')
    
ea_dispt('plot Efield...')
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
         
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), permute(data, [2 1 3]) > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:) , 'FaceAlpha', 0.1, 'Parent', hGroupField);
         
     else
        s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), permute(data, [2 1 3]) > E_layers(i) );

        h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:), 'FaceAlpha', 0.07, 'Parent', hGroupField);

      end
 end
 
 ea_dispt('')
 
elseif strcmp(plot_choice,'vta')
    ea_dispt('plot vta...')
% visualize Efield

 ea_dispt('')
 
 
end
 
 