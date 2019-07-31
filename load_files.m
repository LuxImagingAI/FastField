function [standard_efield,grid_vec,electrode,electrode_patient,atlases] = load_files(dir_fastfield,dir_patient)
% output:
% standard_efield: the standard electric field
% grid_vec : the grid vector where the standard efield is clacilated
% electrode : th estandard model of the electrode
% electrode_patient :  the electrode information of the patietn in mni
% atlases: the atlas structure of the targets of intrest

ea_dispt('load resources ...')

% load the standard grid and Efield
load([dir_fastfield filesep 'resources' filesep 'standard_efield.mat']);

% the elecstode model
load([dir_fastfield filesep 'resources' filesep 'Boston Scientific Vercise Directed.mat']);

% the electrode model of the patient
load([dir_patient filesep 'ea_reconstruction.mat']);
electrode_patient=reco.mni;


load([dir_fastfield filesep 'resources' filesep 'atlas_index.mat']);
%load([dir_fastfield filesep 'resources' filesep 'atlas_me.mat']);

ea_dispt('')

end


