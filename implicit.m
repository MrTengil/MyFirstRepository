%{
This program is used to solve displacements, velocities and accelerations
of a Simple Harmonic Oscillator using IMPLICIT (central difference method).
Inputs:
m = mass
k = stiffness
A = amplitude of oscilation
b = number of periods
resolution = inverse scale factor of critical time step (scales how often to calculate)
%}

function [d, v, a, time] = implicit(m, k, A, b, resolution)
omega = sqrt(k/m);              % Natural frequency of vibratoin
dt_crit = 2*sqrt(m/k);          % Critical time step
dt = dt_crit*(1/resolution);    % Critical time step with a resolution factor added. 

% Initiation of vectors (acceleration, velocity and displacement)
a   = [];
v   = [];
d   = [];

% Boundary conditions
a(1)= 0;
v(1)= A*omega;
d(1)= 0;


time = 0:dt:b*pi*dt_crit; % Creates a time vector with "b" number of periodos

% Calculate the stuff
for i = 1:length(time)-1
    d(i+1) = m*((4/dt^2)*d(i) + (4/dt)*v(i) + a(i))*(dt^2/(4*m + dt^2*k));
    v(i+1) = (2/dt)*(d(i+1)-d(i))-v(i);
    a(i+1) = (2/dt)*(v(i+1)-v(i))-a(i);
end
end