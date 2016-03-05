%% Lab 2
%  As evaluated by James Kerr and James Kurtz

%% Section 4.1: dtmfdesign.m Application of FIR Filter Lengths 40 & 80

% FIR Bandpass Length of 40 
hh = dtmfdesign([697,770,852,941,1209,1336,1477,1633], 40, 8000);

figure(1)
plot(repmat(linspace(0,pi,40)',[1,8]),hh,'o-')
xlabel('Frequency (Hz)')
ylabel('Magnitude (Frequency Response)')
title('DTMF Magnitude Frequency Response (L=40)') 
legend('[697]','[770]','[852]','[941]','[1209]','[1336]','[1477]','[1633]')
hold on;
hold off; 

    %Explanation: 
    %In this case, the FIR filter length is not large enough, as it may be
    %observed in Figure (1) that the numerous passbands overlap each other. 

% FIR Bandpass Length of 80 
hh = dtmfdesign([697,770,852,941,1209,1336,1477,1633], 80, 8000);

figure(2) 
plot(repmat(linspace(0,pi,80)',[1,8]),hh,'o-')
xlabel('Frequency (Hz)')
ylabel('Magnitude (Frequency Response)')
title('DTMF Magnitude Frequency Response (L=80)') 
legend('[697]','[770]','[852]','[941]','[1209]','[1336]','[1477]','[1633]')
hold on;
hold off;

    %Explanation:
    %As observed through Figure (2), with an FIR filter length of 80, the
    %passbands seemingly have no overlap for the frequencies above 852 Hz.
    %The lower frequency bands are extremely constricted (i.e., 697 Hz, 770
    %Hz, 852 Hz). Therefore, a filter length slightly larger than 80 may be
    %preferred; however, the length of 80 is seemingly sufficient.
    
    type dtmfdesign.m

%% Section 4.2: dtmfscore.m Application 

type dtmfscore.m
type dtmfcut.m


%% Section 4.3: dtmfrun.m Application 

type dtmfdial.m
type dtmfrun.m


%% Section 4.4: dtmfdial.m Test

fs = 8000;
kp =['4','0','7','*','8','9','1','3','2','#','B','A','D','C'];
iv = dtmfdial(kp,fs);
soundsc(iv,fs)
L = 80; 
dtmfrun(iv,L,fs);

figure(3)
spectrogram(iv)

