function [Efield,xg,yg,zg,elfv,trans_mat]= fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,Electrode_type)
% for the moment only for boston vercise directed electrode
% output:
% Efield: electric field
% xg,yg,zg coordinates of the efiled 
% elfv: the faces and vertices of the transformed electrode to mni space
% trans_mat: the tranformation matrix from standard space to mni space



ea_dispt('Calculate Efiled ...')

% check the percentages of the contacts
%if sum(perc)==100 || sum(perc)==0
if sum(perc) < 100.9 && sum(perc) > 99.1  || sum(perc)==0
   

    % calculate the new E_field
    [Efield] = get_efield(perc,standard_efield,amp,Electrode_type,conductivity);


    % Calculate the transformation matrix from the stamdard space to patient
    % mni space
    [trans_mat,elfv,xg,yg,zg] = get_trans_mat(electrode,electrode_patient,grid_vec,side);


else
   error('Error: Sum of the contacts should be equal to 100')
   
end
ea_dispt('')
end









