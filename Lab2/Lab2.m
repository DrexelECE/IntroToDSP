%% Lab 2
%  As evaluated by James Kerr and James Kurtz

%% Task 1: Sampling of Given Signal
clear; clc;

A = 10;
f0 = 100;
phi = pi/4;
fs = 400;
t = 1;
% t = 1/f0; % used to more closely examine one period. 

Ts = 1/fs;
N = t*fs;
tn = 0:Ts:t;

x = A*cos(2*pi*f0*tn+phi);

% For Comparison
tx = 0:t/10000:t;
xt = A*cos(2*pi*f0*tx+phi);


figure(1);
plot(tx, xt, tn, x);
legend('Original Signal','Sampled Signal');

% Discussion:
%   The signal has a frequency of 100 Hz.  The sampling frequency, 400 Hz,
%   is sufficient, as it is more than twice the Nyquist rate.  

%   There are four samples taken per cycle of the signal. 

%% Task 2: DFT and IDFT

tic;
myX = my_dft(x);
mytime = toc;

tic;
matX = fft(x);
mattime = toc;

fprintf('my_dft and fft agree within %E\n', sum(abs(matX - myX)));
fprintf('my_dft was calculated in %0.8f sec\n', mytime);
fprintf('fft  was  calculated  in %0.8f sec\n', mattime);

fprintf('\n');

tic;
myx = my_idft(myX);
mytime = toc;

tic;
matx = ifft(myX);
mattime = toc;

fprintf('my_idft and ifft agree within %E\n', sum(abs(matx - myx)));
fprintf('my_idft was calculated in %0.8f sec\n', mytime);
fprintf('ifft  was  calculated  in %0.8f sec\n', mattime);

% Discussion:
%   While the return values of the DFT and FFT are comprable (as are their
%   inverses), the time needed to compute them is notably different.
%   Depending on the length of x, the FFT (and IFFT) can be orders of
%   magnitude faster. 

type my_dft;

type my_idft;


%% Lab Exercise
% I am unsure as to how to answer the question, as I do not believe there
% was a 'warm-up' section with a 150 Hz sinusoid per the question
% description. 
% In essence, Spectral Leakage refers to the phenomena of additional
% frequency components within the frequency spectrum of the provided
% signal. These additional components manifest in varying ways, including
% ailiasing as well as signal noise, which may occur as a result of
% sampling and windowing respectively. Generally, the spectral leakage
% blurs the original signal, including the manifestation of sidelobes.
