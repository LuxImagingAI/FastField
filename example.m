% example

% clear all; %close all;

dir_fastfield='/Users/mehri.baniasadi/Documents/GitHub/FastField';
dir_patient = '/Users/mehri.baniasadi/Desktop/SelectedPatients/BOSTON/96376/DistalPacer96376/output/dbsar2leaddbs';

% Perc is the percentage assigned to each contact
% for segmented electrodes
% 1 is is the bottom contact, 8 is the topest contact
% 2,3,4 are each segment of the second ring from the bottom
% 5,6,7 are each segment of the third ring from the bottom
% for ring elecetrodes 
% 1 is the bottom contact then 2 and 3,and 4 the topeset contact;
perc = [0 0 0 0 0 0 100 0];


amp = 1; % amplitude in mA

side = 2; % Right is 1,  Left is 2

Electrode_type = 'boston_vercise_directed'; %'medtronic_3389'; % 'boston_vercise';'medtronic_3387';
                                             %'stjude_directed_short'; %'stjude_directed_long';  
                                             %'stjude_activetip_2mm'; 'stjude_activetip_3mm'
conductivity = 0.1;

Threshold = 200; % the treshold for Efield visualisation

plot_choice = 'vta';%vta_efield

amp_mode = 'mA'; % 'V'

% load resources
[standard_efield,grid_vec,electrode,electrode_patient,atlases] = load_files(dir_fastfield,dir_patient,Electrode_type,amp_mode);


% get the Efield
[Efield,xg,yg,zg,elfv,trans_mat] = fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,amp_mode);

 brain_structures{1} = 'STN1';

% for t=1:length(atlases.labels{1, 1})
%  brain_structures{t} =   atlases.labels{1, 1}{t};
% end

% visualize Efield

figure;

plot_elec(elfv,electrode,perc);
plot_efield(Efield,xg,yg,zg,plot_choice,Threshold);

%plot_atlas(brain_structures,atlases,side) 





