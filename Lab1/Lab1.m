%% Lab 1
%  As evaluated by James Kerr and James Kurtz

%% Task 1
clear; clc;

x = 2+3i;
y = 5*exp(-1i*3/5);
z = 3*exp(-4i/pi);

u1 = x+y-z;
f_printAmpPhase(u1);

v1 = conj(x)/abs(x)+y-conj(z);

f_printAmpPhase(v1);


%% Task 2
clear; clc;

x1 = -1:0.01:1;
x2 = -1:0.20:1;

figure(1);
plot(x1,u(x1), x2, u(x2));
title 'u(x) for -1 to 1 with steps of 0.01 and 0.20';
xlabel('x');
ylabel('u(x)');
legend('0.01', '0.20');
grid on;

% Discussion:
fprintf(['Steps of 0.01 better represent the ideal step function than steps ' ...
        'of 0.20 because it has a higher sample rate.  The *ideal* step '...
        'function has an infinite sample rate because the last 0 value is '...
        'immediatly before the first 1 value.']);
    

x1 = -1:0.05:1;
    
    
figure(2);
plot(x1,r(x1),'-ob', ...
    'MarkerEdgeColor', 'r', ...
    'MarkerFaceColor', 'r', ...
    'MarkerSize', 3);
title 'r(x) for -1 to 1 with steps of 0.05';
xlabel('x');
ylabel('r(x)');
grid on;


%% Task 3
clear; clc;

t = -2:0.001:4;

f1 = 4 + 2*u(t+3) - r(t+1) + r(t-5);
f2 = u(t) .* u(6-t); % Assuming use of the Hadamard product
f3 = u(t) - u(6-t);
f4 = 2*sin(r(t));
f5 = r(2*sin(t));


figure(3);
plot(t, f1, t, f2, t, f3, t, f4, t, f5);
grid on;
title 'Plots of given functions';
xlabel 't';
ylabel 'f(t)';
legend('f1(t)','f2(t)','f3(t)','f4(t)','f5(t)');

%% Task 4
clear; clc;

resolution = .00001*pi;

t = -10*pi:resolution:1*pi;

x = sin(4*pi*t) + cos(6*pi*t);
y = sin(pi*t/2) + sin(t);

figure(4);
plot(t, x, t, y);
grid on;
title 'Plots of x(t) and y(t)';
xlabel 't';
ylabel 'x(t) or y(t)';
legend('x(t)','y(t)');

% TODO: Do the writing-part of Task 4. 


%% Functions Used:

type f_printAmpPhase;

type f_amplitude;

type f_phase;

type u;

type r;
