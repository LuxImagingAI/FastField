function [Efield] = get_efield(perc,standard_efield,amp,conductivity,amp_mode)
% inputs:
% percentage on each contact
% standard_efield: the standard efield is provided in the resources folder
% of the fastfield
% amp: stimulation amplitude
% Electrode_type: the name of the stimulation electrode
% conductivity: the brain conductivity

%ouput:
% Efield: the electric field with the defiend parameters

perc=perc/100;


% calculate the efield for this configuration
eeg = zeros(100,100,100);

for len = 1:length(standard_efield)
    eeg = eeg + (perc(len)*standard_efield{len,1});
end

% scale the conductivity by 0.14 because the standard efield is generated
% with conductivity of 0.1
if strcmp(amp_mode,'mA')
    scale_con= 0.1 / conductivity;
    eeg = eeg*scale_con;
end

% scale the electric field by amplitude, the standard efield is genereated
% for amplitude of 1mA
eeg = eeg*amp;

eeg(isnan(eeg))=0;
eeg(eeg>10000) = 10000;

% Smooth data
%Efield = smooth3(eeg,'box',9);
%Efield = eeg;
Efield = smooth3(eeg,'gaussian', 9,3);
end


