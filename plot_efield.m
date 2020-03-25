function [hGroupField] = plot_efield(Efield,xg,yg,zg,plot_choice,Threshold)


lg=length(xg);
if strcmp(plot_choice,'vta_efield')
    
    %time_tracker('plot Efield...')
    % visualize Efield
    min_e=min(Efield(:));
    max_e=max(Efield(:));
    
    range_e=max_e-min_e;
    step_e=range_e/63;
    
    %    E_layers = min_e:step_e:max_e;
    
    %E_layers = 1e-7:1/62:200
    
    E_layers1  = linspace(0,Threshold-0.1,5);
    E_layers2 = linspace(Threshold,10000,59);
    E_layers=[E_layers1,E_layers2];
    
    cut = 1:lg;
    
    data = Efield(:,:,cut);
    X=xg;
    Y=yg;
    Z=zg;
    
    cmap = colormap(autumn);
    hGroupField = hggroup();
    h = {};
    
    
    for i = 1:length(E_layers)
        
%         if E_layers(i) > Threshold
%             
%             s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > E_layers(i) );
%             
%             h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:) , 'FaceAlpha', 0.25, 'Parent', hGroupField);
%             
%         else
            s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > E_layers(i) );
            
            h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(i,:), 'FaceAlpha', 0.06, 'Parent', hGroupField);
            
 %       end
    end
    
    ea_dispt('')
    
elseif strcmp(plot_choice,'vta')
    %   ea_dispt('plot vta...')
    % visualize Efield
    
    
    cut = 1:lg;
    
    data = Efield(:,:,cut);
    %data = smooth3(data1,'box',9);
    X=xg;
    Y=yg;
    Z=zg;
    
    cmap = colormap(autumn);
    hGroupField = hggroup();
    h = {};
    
    
    s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > Threshold );
    

    h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', cmap(1,:) , 'FaceAlpha', 0.35, 'Parent', hGroupField);
    %cmap(1,:)
    
    %time_tracker('')
    
end
end


