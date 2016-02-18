%% Lab 2
%  As evaluated by James Kerr and James Kurtz

%% Task 1: Sampling of Given Signal
clear; clc;

A = 10;
f0 = 100;
phi = pi/4;
fs = 400;
t = 1;
t = 1/f0; % used to more closely examine one period. 

Ts = 1/fs;
N = t*fs;
tn = 0:Ts:t;

x = A*cos(2*pi*f0*tn+phi);

% For Comparison
tx = 0:t/10000:t;
xt = A*cos(2*pi*f0*tx+phi);


figure(1);
plot(tx, xt, tn, x);
grid on;
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
% It is not entirely clear what is intended with this question, as there
% exists no 150Hz sinusoid in this assignment.  I'm assuming the question
% is referring to the 100Hz sinusoid at the beginning of the assignment.  
%
% In that signal, although the sampling rate was above the Nyquist rate,
% the sampled points aligned with the input signal such that the samples
% only ever captured about 70% of the signal amplitude, and did so with a
% vaveform that resembles clipping.  This creates spectral leakage by
% blending the attributes of a normal sine wave, the signal, with some of
% the spectral attributes of a square wave, which is, in this case, noise.
% Although a fourier transform of the original signal should render a pure
% singal of the original frequency, a fourier transform of the sampled
% signal would also show other, higher frequencies that attempt to
% reconstruct the flattened peaks of the sampled signal. 
%
% Since, however, most of the frequencies created by this noise should be
% higher than half the sampling rate, those portions of the signal can be
% immediately discarded.  Also, if full reconstruction of the original
% signal is vital (which, may or may not actually be the case, depending on
% the application), it may be possible to use a non-liner regression to
% connect the points.  That is, it may be possible to align sinusoids to
% the sampled points, rather than simply drawing lines between the points.
% 
% Something like this is accomplished when a sampled signal is sent into a
% speaker which has a driver of noteworthy mass.  Since the driver has 
% mass, and thus has inertia, as the signal approaches each peak, the 
% driver will continue through and beyond the physcical point correlating 
% to the sample point, before rebounding back toward the next sample point.  
% While this is very unlikely to recreate the full sinusoid shape, it would
% provide an audio signal more 'rounded' than a plot of the sampled signal.
% 
