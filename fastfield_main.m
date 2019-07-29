function [Efield,xg,yg,zg,elfv,trans_mat]= fastfield_main(dir_estimefield,dir_patient,perc,amp,side)
% for the moment only for boston vercise directed electrode
ea_dispt('Calculate Efiled ...')

% check the percentages of the contacts
if sum(perc)==100 || sum(perc)==0
   
    
    % load needed resources
    [E_field_fixed,grid_vec,electrode,electrode_patient] = load_files(dir_estimefield,dir_patient);

    % calculate the new E_field
    [Efield] = get_efield(perc,E_field_fixed,amp);


    % Calculate the transformation matrix from the stamdard space to patient
    % mni space
    [trans_mat,elfv,xg,yg,zg] = get_trans_mat(electrode,electrode_patient,grid_vec,side);


else
   error('Error: Sum of the contacts should be equal to 100')
   
end
ea_dispt('')
end








