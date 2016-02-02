%% Lab 2
%  As evaluated by James Kerr and James Kurtz

%% Task 1: Sampling of given signal
clear; clc;

A = 10;
f0 = 100;
phi = pi/4;
fs = 400;
t = 1/f0;

Ts = 1/fs;
N = t*fs;
tn = 0:Ts:t;

x = A*cos(2*pi*f0*tn+phi);

% For Comparison
tx = 0:t/1000:t;
xt = A*cos(2*pi*f0*tx+phi);


figure(1);
plot(tx, xt, tn, x);
legend('Original Signal','Sampled Signal');

% Discussion:
%   The signal has a frequency of 100 Hz.  The sampling frequency, 400 Hz,
%   is sufficient, as it is more than twice the Nyquist rate.  There are
%   four samples taken per cycle of the signal. 

