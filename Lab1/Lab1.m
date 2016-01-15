%% Task 1
clc;

x = 2+3i;
y = 5*exp(-1i*3/5);
z = 3*exp(-4i/pi);

u1 = x+y-z;
printAmpPhase(u1);

v1 = conj(x)/abs(x)+y-conj(z);

printAmpPhase(v1);


%% Task 2
clc;

x1 = -1:0.05:1;

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




