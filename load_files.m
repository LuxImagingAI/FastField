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
    load([dir_fastfield filesep 'resources' filesep 'medtronic_3389.mat']);


elseif strcmp(Electrode_type,'medtronic_3387')

    load([dir_fastfield filesep 'resources' filesep 'standard_efield_m3387.mat']);
    load([dir_fastfield filesep 'resources' filesep 'medtronic_3387.mat']);
    
    
elseif strcmp(Electrode_type,'medtronic_3391')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_m3391.mat']);
    load([dir_fastfield filesep 'resources' filesep 'medtronic_3391.mat']);


elseif strcmp(Electrode_type,'boston_vercise_directed')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_boston_directed.mat']);
    load([dir_fastfield filesep 'resources' filesep 'Boston Scientific Vercise Directed.mat']);


elseif strcmp(Electrode_type,'boston_vercise')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_boston.mat']);
    load([dir_fastfield filesep 'resources' filesep 'boston_vercise.mat']);


elseif strcmp(Electrode_type,'stjude_directed_short')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_stjude_directed_short.mat']);
    load([dir_fastfield filesep 'resources' filesep 'stjude_directed_05.mat']);



elseif strcmp(Electrode_type,'stjude_directed_long')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_stjude_directed_long.mat']);
    load([dir_fastfield filesep 'resources' filesep 'stjude_directed_15.mat']);


 elseif strcmp(Electrode_type,'stjude_activetip_2mm')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_stjude_2mmactivetip_.mat']);
    load([dir_fastfield filesep 'resources' filesep 'stjude_activetip_2mm.mat']);



elseif strcmp(Electrode_type,'stjude_activetip_3mm')


    load([dir_fastfield filesep 'resources' filesep 'standard_efield_stjude_3mmactivetip.mat']);
    load([dir_fastfield filesep 'resources' filesep 'stjude_activetip_3mm.mat']);




elseif strcmp(Electrode_type,'')


    load([dir_fastfield filesep 'resources' filesep '']);
    load([dir_fastfield filesep 'resources' filesep '']);


end





% the electrode model of the patient
load([dir_patient filesep 'ea_reconstruction.mat']);
electrode_patient=reco.mni;



% load the atlas
load([dir_fastfield filesep 'resources' filesep 'atlas_combined.mat']);


ea_dispt('')

end


