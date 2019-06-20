%{
This program is used to solve displacement 
of a (1D) Simple Harmonic Oscillator using explicit (central difference method)
aswell as implicit method.
m = mass in motion
k = stiffness of the spring
A = amplitude of oscilation
b = number of periods of which to calculate
resolution = inverse scale factor of critical time step (scales how often to calculate)
%}
clear all

% Input data
m = 1;
k=1e3;
A = 2;
b=4;
resolution = 1;

% Solver
[de, ve, etime] = explicit(m, k, A, b, resolution);     % Explicit
[di, vi, ai, itime] = implicit(m, k, A, b, resolution); % Implicit

% Post processing
plot(etime, de, itime, di)
legend('Explicit', 'Implicit')
xlabel('Time')
ylabel('Displacement')