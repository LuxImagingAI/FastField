function [Efield] = get_efield(perc,standard_efield,amp)

perc=perc/100;
eeg=((perc(1)*standard_efield{1,1})+(perc(2)*standard_efield{2,1})+...
(perc(3)*standard_efield{3,1})+(perc(4)*standard_efield{4,1})...
+(perc(5)*standard_efield{5,1})+(perc(6)*standard_efield{6,1})+...
(perc(7)*standard_efield{7,1})+(perc(8)*standard_efield{8,1}));

eeg=eeg*amp;
eeg(isnan(eeg))=0;
eeg(eeg>10000)=10000; 
data = smooth3(eeg,'box',5);

Efield=permute(data, [2 1 3]);

end

