function [Efield,xg,yg,zg,elfv]= EstimEfield_main(dir_estimefield,dir_patient,perc,amp,side)

ea_dispt('Calculate Efiled ...')
%% check the percentages of the contacts
if sum(perc)==100

%% load the standard grid and Efield
load([dir_estimefield filesep 'E_field_fixed.mat']);
gv=grid_vec;



%% calculate the new E_field
[Efield] = get_efield(perc,E_field_fixed,amp);



%% Calculate the transformation matrix from the stamdard space to patient
% mni space

load([dir_estimefield filesep 'Boston Scientific Vercise Directed.mat']);
load([dir_patient filesep 'ea_reconstruction.mat']);
elstruct=reco.mni;

[Y,elfv,xg,yg,zg] = get_trans_mat(electrode,elstruct,gv,side);



else
   error('Error: Sum of the contacts should be equal to 100')
   
end
ea_dispt('')
end









