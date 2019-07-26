function [Efield] = get_efield(perc,E_field_fixed,amp)

perc=perc/100;
eeg=((perc(1)*E_field_fixed{1,1})+(perc(2)*E_field_fixed{2,1})+...
(perc(3)*E_field_fixed{3,1})+(perc(4)*E_field_fixed{4,1})...
+(perc(5)*E_field_fixed{5,1})+(perc(6)*E_field_fixed{6,1})+...
(perc(7)*E_field_fixed{7,1})+(perc(8)*E_field_fixed{8,1}));

eeg=eeg*amp;
eeg(isnan(eeg))=0;
eeg(eeg>10000)=10000; 
Efield=eeg;

end