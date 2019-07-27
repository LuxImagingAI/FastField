% example

clear all; %close all;

% calculate the Efield

dir_estimefield='/Users/mehri.baniasadi/Documents/GitHub/EstimEField';
dir_patient='/Users/mehri.baniasadi/Documents/GitHub/EstimEField/patient1';
% Perc is the percentage assigned to each contact
% 1 is is the bottom contact 8 is the topest contact
% 2,3,4 are each segment of the second ring from the bottom
% 5,6,7 are each segment of the third ring from the bottom
perc=[50,50,0,0,0,0,0,0];
amp=3; % amplitude in mA
side=2; % Right is 1,  Left is 2

[Efield,xg,yg,zg,elfv,trans_mat]= EstimEfield_main(dir_estimefield,dir_patient,perc,amp,side);


% visualize Efield

target='stn'; % for the moment only for stn or vim
plot_efield(Efield,xg,yg,zg,perc,elfv,dir_estimefield,target,side);