function plot_atlas(brain_structures,atlases,side)

hTarget = hggroup();

colormap(parula)
%colormap


for k=1:length(brain_structures)
    
    tar = brain_structures{k};
    
    [Ind,] = find(strcmp(tar,atlases.labels{1, 1})==1);
    
    if ~isempty(Ind)
        hTarget  = [];
        if side == 1
            hTarget = patch(atlases.fv{Ind,1}, 'FaceColor', atlases.colormap(Ind,:), 'EdgeColor', 'none', 'FaceAlpha', 0.45);
            material dull
        elseif side == 2
           hTarget = patch(atlases.fv{Ind,2}, 'FaceColor', atlases.colormap(Ind,:), 'EdgeColor', 'none', 'FaceAlpha', 0.45);
            material dull
        end
    end
end

end