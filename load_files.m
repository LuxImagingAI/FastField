function [E_field_fixed,grid_vec,electrode,electrode_patient] = load_files(dir_estimefield,dir_patient)

% load the standard grid and Efield
load([dir_estimefield filesep 'resources' filesep 'E_field_fixed.mat']);

% the elecstode model
load([dir_estimefield filesep 'resources' filesep 'Boston Scientific Vercise Directed.mat']);

% the electrode model of the patient
load([dir_patient filesep 'ea_reconstruction.mat']);
electrode_patient=reco.mni;

end