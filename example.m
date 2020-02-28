
% example

% clear all; %close all;

dir_fastfield='/Users/mehri.baniasadi/Documents/GitHub/FastField';
dir_patient = '/Users/mehri.baniasadi/Documents/GitHub/FastField/case_studies/case_study_1';

% Perc is the percentage assigned to each contact
% for segmented electrodes
% 1 is is the bottom contact, 8 is the topest contact
% 2,3,4 are each segment of the second ring from the bottom
% 5,6,7 are each segment of the third ring from the bottom
% for ring elecetrodes 
% 1 is the bottom contact then 2 and 3,and 4 the topeset contact;
perc = [20 80 0 0 0 0 0 0];

amp=1.8;
side = 2; % Right is 1,  Left is 2

Electrode_type = 'boston_vercise_directed'; %'medtronic_3389'; % 'boston_vercise';'medtronic_3387';
%  Electrode_type = 'pins_l303'   % 'boston_vercise_directed';
  %'stjude_directed_short'; %'stjude_directed_long';  
                                             %'stjude_activetip_2mm'; 'stjude_activetip_3mm'
conductivity = 0.1;

Threshold = 200; % the treshold for Efield visualisation

plot_choice = 'vta';%vta_efield

amp_mode = 'V'; %'mA'; % 'V'

impedence = 1000; % only needed if the amp_mode= 'V' otherwise it can be empty = [];

% load resources
[standard_efield,grid_vec,electrode,electrode_patient,atlases,electrode_native] = load_files(dir_fastfield,dir_patient,Electrode_type);


% get the Efield
[Efield,xg,yg,zg,elfv,trans_mat] = fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,amp_mode,impedence);

brain_structures{1} = 'STN2';
% the name of the structures can be find in the file "atlas_combined.mat"
%atlases.labels{1, 1}  

% to have more than one structure:
% for t=1:length(atlases.labels{1, 1})
%  brain_structures{t} =   atlases.labels{1, 1}{t};
% end

%% visalization
figure;
hold on;

plot_elec(elfv,electrode,perc);
plot_efield(Efield,xg,yg,zg,plot_choice,Threshold);
plot_atlas(brain_structures,atlases,side);


view(-221,-5)
camlight('right')
camlight( 90, -45, 'infinite');