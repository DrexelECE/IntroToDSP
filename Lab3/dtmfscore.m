function sc = dtmfscore(iv, hh)
%dtmfscore.m: Returns score established by maximum amplitude

iv = iv*(2/max(abs(iv))); %--Scale the input x[n] to the range [-2,+2]

yy = conv(iv,hh); %Convolution to be scored

%Scores 1 if yy is > .59, else scores 0
if max(yy(200:length(yy)-200)) >= .59
    sc = 1;
else
    sc = 0;
end

