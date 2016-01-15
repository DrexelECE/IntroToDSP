%% Task 1

x = 2+3i;
y = 5*exp(-1i*3/5);
z = 3*exp(-4i/pi);

u1 = x+y-z;
printAmpPhase(u1);

v1 = conj(x)/abs(x)+y-conj(z);

printAmpPhase(v1);


%% Task 2

x1 = -1:0.01:1;
x2 = -1:0.2:1;

figure(1);
plot(x1,u(x1), x2, u(x2));
title 'u(x) for -1 to 1 with steps of 0.01 and 0.20';
legend('0.01', '0.20');

% Discussion:
printf(['Steps of 0.01 better represent the ideal step function than steps ' ...
        'of 0.20 because the *ideal* step function ']);
