%{
This function compares explicit and implicit method of solving displacement
as a function of time of a mass-spring system.
%}

m   = 10;
k   = 10;
A   = 2;
NoOfOscillations   = 30;
resolution  = 1;
omega   = sqrt(k/m);

% ------
d1  = [];
d2  = [];
d3  = []

d1 = explicit( m, k, A, NoOfOscillations, resolution);
d2 = implicit( m, k, A, NoOfOscillations, resolution);

% ------ Analytic solution -----

dt = linspace( 0, NoOfOscillations*2*pi, length(d1));

d3 = A*sin(omega*dt);

plot(dt, d1, '-', dt, d2, '-', dt, d3)
legend('explicit', 'implicit', 'analytic')
title(['Explicit vs implicit vs analytic with a resolution ', num2str(resolution), '*2*pi'])