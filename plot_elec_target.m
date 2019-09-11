
function plot_elec_target(elfv,atlases,target,side,electrode,perc)

%ea_dispt('Plot the Electrode and the target ...')



% visualize Electrode
hGroupElec = hggroup();

perc(9)=0;
hold on;

for i=1:length(elfv)
   % if(ismember(i, [1 2 3 4 5 6 7 8 9]))
    if(ismember(i, [1:length(electrode.contacts)]))
        if perc(i)>0
           patch(elfv(i), 'FaceColor', [0.9 0.7 0.1] , 'EdgeColor', 'none', 'Parent', hGroupElec);
        else
           patch(elfv(i), 'FaceColor', rgb('dimgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
          
         end
    elseif (ismember(i, [length(electrode.contacts)+1:length(electrode.contacts)+length(electrode.insulation)]))
        patch(elfv(i), 'FaceColor', rgb('lightgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
     
    end
end


 
% visualize Target



[Ind,] = find(strcmp(target,atlases.labels{1, 1})==1);

if ~isempty(Ind)
hTarget  = [];
    if side == 1
            hTarget = patch(atlases.fv{Ind,1}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
            material dull
       elseif side == 2
            hTarget = patch(atlases.fv{Ind,2}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
            material dull
    end
end
% 
% hTarget  = [];
% if strcmp(target,'stn')
%     hold on;
%     if side == 1
%             hTarget = patch(atlases.fv{1,1}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%        elseif side == 2
%             hTarget = patch(atlases.fv{1,2}, 'FaceColor', [0 0.75 0.75], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%     end
%     
% elseif strcmp(target,'stn_motor')
%       hold on;
%         if side == 1
%             hTarget = patch(atlases.fv{2,1}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%             
%        elseif side == 2
%             hTarget = patch(atlases.fv{2,2}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%         end
%         
% elseif strcmp(target,'vim')
%       hold on;
%         if side == 1
%             hTarget = patch(atlases.fv{18,1}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%             
%        elseif side == 2
%             hTarget = patch(atlases.fv{18,2}, 'FaceColor', [0 0.5 0.62], 'EdgeColor', 'none', 'FaceAlpha', 0.45);
%             material dull
%         end
%     
% end
% camlight left;
% camlight('headlight')
% camlight('right')
%lighting gouraud
daspect([1 1 1]);
addToolbarExplorationButtons(gcf);
% ea_dispt('');
% set(gca,'color',[0.9 0.9 0.9]);
 set(gca,'XTick',[]);
 set(gca,'Xcolor','none')
 set(gca,'YTick',[]);
 set(gca,'Ycolor','none')
 set(gca,'ZTick',[]);
 set(gca,'Zcolor','none')
% title('Estimated Efield');
end
