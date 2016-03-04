function hh = dtmfdesign(fb, L, fs)
n = 0:L-1;
w = 0:pi/300:pi; %Matrix of frequencies for B

for ii = 1:length(fb)
    %Bandpass filter
    hu(ii,:) = cos(2*pi*fb(ii)*n/fs);

    %Scaling Coeffecients' Vector
    B(ii,:) = abs(1/(max(freqz(hu(ii,:),1,w)))); 

    %Scale filters
    ha(ii,:) = hu(ii,:)*B(ii,:);
end

%Filters in columns
hh = ha';

