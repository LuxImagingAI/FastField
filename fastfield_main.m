function [Efield,xg,yg,zg,elfv,trans_mat]= fastfield_main(standard_efield,grid_vec,electrode,electrode_patient,perc,amp,side,conductivity,amp_mode,impedence)
% inputs:
% standard_efield: the standard efield is provided in the resources folder
% of the fastfield
% grid_vec: is the standard grid points, on whihc the standard efield is
% calculated
% electrode: is the electrode model
% electrode_patient: is the location of the patient's electrode in mni
% space
% percentage on each contact
% amp: stimulation amplitude
% side: 1 is right side of the brain and 2 is left side.
% conductivity: the brain conductivity
% Electrode_type: the name of the stimulation electrode

% output:
% Efield: electric field
% xg,yg,zg coordinates of the efiled 
% elfv: the faces and vertices of the transformed electrode to mni space
% trans_mat: the tranformation matrix from standard space to mni space


ea_dispt('Calculate Efiled ...')

if sum(perc) < 100.9 && sum(perc) > 99.1  || sum(perc)==0
    
   if amp >= 0 
       
       if conductivity > 0 

    % calculate the new E_field
    [Efield] = get_efield(perc,standard_efield,amp,conductivity,amp_mode,impedence);


    % Calculate the transformation matrix from the stamdard space to patient mni space
    [trans_mat,elfv,xg,yg,zg] = get_trans_mat(electrode,electrode_patient,grid_vec,side);
    %[trans_mat,elfv,xg,yg,zg] = get_trans_mat_new(electrode,electrode_patient,grid_vec,side,electrode_native);
    
       else
           error('Error: Conductivity should be greater than zero')
       end

   else
       error('Error: Amplitude should be a positive value')
   end
   
else
   error('Error: Sum of the contacts should be equal to 100')
   
end
ea_dispt('')
end









