function [standard_efield,grid_vec,electrode,electrode_patient,atlases] = load_files(dir_fastfield,dir_patient,Electrode_type)
% output:
% standard_efield: the standard electric field
% grid_vec : the grid vector where the standard efield is clacilated
% electrode : th estandard model of the electrode
% electrode_patient :  the electrode information of the patietn in mni
% atlases: the atlas structure of the targets of intrest

    
ea_dispt('load resources ...')

% load the standard grid and Efield
% the elecstode model
if strcmp(Electrode_type,'medtronic_3389')
    
load([dir_fastfield filesep 'resources' filesep 'standard_efield_m3389.mat']);
load([dir_fastfield filesep 'resources' filesep 'medtronic 3389.mat']);


elseif strcmp(Electrode_type,'medtronic_3387')
    
load([dir_fastfield filesep 'resources' filesep 'standard_efield_m3387.mat']);
load([dir_fastfield filesep 'resources' filesep 'medtronic 3387.mat']);


elseif strcmp(Electrode_type,'boston_vercise_directed')


load([dir_fastfield filesep 'resources' filesep 'standard_efield_boston_directed.mat']);
load([dir_fastfield filesep 'resources' filesep 'Boston Scientific Vercise Directed.mat']);
end




% the electrode model of the patient
load([dir_patient filesep 'ea_reconstruction.mat']);
electrode_patient=reco.mni;




load([dir_fastfield filesep 'resources' filesep 'atlas_index.mat']);

ea_dispt('')

end


