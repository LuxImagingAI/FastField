% example

% clear all; %close all;
% dir_fastfield='/Users/andreas/Documents/GitHub/FastField/';
% dir_patient='/Users/andreas/Documents/DATA/isabelfa/Habenula Shangai/CONVERTED/Likai/';
dir_fastfield='/Users/mehri.baniasadi/Documents/GitHub/FastField';
dir_patient=pwd;

% Perc is the percentage assigned to each contact
% 1 is is the bottom contact, 8 is the topest contact
% 2,3,4 are each segment of the second ring from the bottom
% 5,6,7 are each segment of the third ring from the bottom
perc=[0,0,0,0,0,0,100,0];
amp=2; % amplitude in mA
side=1; % Right is 1,  Left is 2


% load resources
[standard_efield,grid_vec,electrode,electrode_patient,atlases] = load_files(dir_fastfield,dir_patient);

% get the Efield
[Efield,xg,yg,zg,elfv,trans_mat] = fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side);


%data=Efield;


% visualize Efield
target='vim'; % for the moment only for stn or vim
figure;
[hGroupElec, hTarget] = plot_elec_target(elfv,atlases,target,side);


plot_choice='vta_efield'; % other option: vta_efield
[hGroupField] = plot_efield(Efield,xg,yg,zg,plot_choice);







