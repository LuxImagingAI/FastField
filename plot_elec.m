
function plot_elec(elfv,electrode,perc)
% inputs:
% elfv:
% electrode:
% perc:


%ea_dispt('Plot the Electrode ...')

% visualize Electrode
hGroupElec = hggroup();

perc(9)=0;
hold on;

for i=1:length(elfv)
    if(ismember(i, [1:length(electrode.contacts)]))
        if perc(i)>0
        %    patch(elfv(i), 'FaceColor', [0.9 0.7 0.1] , 'EdgeColor', 'none', 'Parent', hGroupElec);
          patch(elfv(i), 'FaceColor', rgb('dimgray') , 'EdgeColor', 'none', 'Parent', hGroupElec);
        
        else
            patch(elfv(i), 'FaceColor', rgb('dimgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
            
        end
    elseif (ismember(i, [length(electrode.contacts)+1:length(electrode.contacts)+length(electrode.insulation)]))
        patch(elfv(i), 'FaceColor', rgb('lightgray'), 'EdgeColor', 'none', 'Parent', hGroupElec);
        
    end
end



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
title('Estimated Efield');
end
