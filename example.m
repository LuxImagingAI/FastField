
% example

% clear all; %close all;

dir_fastfield='/Users/mehri.baniasadi/Documents/GitHub/FastField';
dir_patient = '/Users/mehri.baniasadi/Desktop/SelectedPatients/BOSTON/96376/DistalPacer96376/output/dbsar2leaddbs';
dir_patient = pwd;
% Perc is the percentage assigned to each contact
% for segmented electrodes
% 1 is is the bottom contact, 8 is the topest contact
% 2,3,4 are each segment of the second ring from the bottom
% 5,6,7 are each segment of the third ring from the bottom
% for ring elecetrodes 
% 1 is the bottom contact then 2 and 3,and 4 the topeset contact;
%
perc = [0 15 75 10 0 0 0 0];
%perc = [0 32 0 0 68 0 0 0];
%perc=[40 60 0 0 0 0 0 0];
%perc=[0 24 23 23 10 10 10 0]
%perc=[0 25 0 25 25 0 25 0];
%perc=[0 0 0 100];
%perc=[0 55 45 0]
%perc=[60 40 0 0]
%amp = 2.5; % amplitude in mA
amp=3;
side = 2; % Right is 1,  Left is 2

Electrode_type = 'boston_vercise'; %'medtronic_3389'; % 'boston_vercise';'medtronic_3387';
%  Electrode_type = 'pins_l303'   % 'boston_vercise_directed';
  %'stjude_directed_short'; %'stjude_directed_long';  
                                             %'stjude_activetip_2mm'; 'stjude_activetip_3mm'
conductivity = 0.1;

Threshold = 200; % the treshold for Efield visualisation

plot_choice = 'vta';%vta_efield

amp_mode = 'mA'; %'mA'; % 'V'

% load resources
[standard_efield,grid_vec,electrode,electrode_patient,atlases] = load_files(dir_fastfield,dir_patient,Electrode_type,amp_mode);




% get the Efield
[Efield,xg,yg,zg,elfv,trans_mat] = fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,amp_mode);

% brain_structures{1} = 'STN1';

% for t=1:length(atlases.labels{1, 1})
%  brain_structures{t} =   atlases.labels{1, 1}{t};
% end

% visualize Efield
% 
figure;
hold on;

plot_elec(elfv,electrode,perc);
plot_efield(Efield,xg,yg,zg,plot_choice,Threshold);

%plot_atlas(brain_structures,atlases,side) 

%view(180,0)
%camlight('left');
%camlight( 90, -45, 'infinite');
%camlight( 90, 45, 'infinite');



%%
hold on;

    cut = 1:100;
    
    data = Efield(:,:,cut);
    X=xg;
    Y=yg;
    Z=zg;
    
    cmap = colormap(autumn);
    hGroupField = hggroup();
    h = {};
    
    
    s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > Threshold );
    
    h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', [0.8 0.2 0.2] , 'FaceAlpha', 0.3, 'Parent', hGroupField);

    
    
conductivity = 0.22;

[Efield,xg,yg,zg,elfv,trans_mat] = fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,amp_mode);
hold on;

    cut = 1:100;
    
    data = Efield(:,:,cut);
    X=xg;
    Y=yg;
    Z=zg;
    
    cmap = colormap(autumn);
    hGroupField = hggroup();
    h = {};
    
    
    s = isosurface(X(:,:,cut), Y(:,:,cut), Z(:,:,cut), data > Threshold );
    
    h{end+1} = patch(s, 'EdgeColor', 'none', 'FaceColor', [0.2 0.2 0.8] , 'FaceAlpha', 0.3, 'Parent', hGroupField);

