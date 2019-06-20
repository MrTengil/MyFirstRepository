function [d, v, time] = explicit(m, k, A, b, resolution)
%{
This program is used to solve displacement
of a Simple Harmonic Oscillator using EXPLICIT (central difference method).
m = mass
k = stiffness
A = amplitude of oscilation
b = number of periods
resolution = inverse scale factor of critical time step (scales how often to calculate)
%}

omega = sqrt(k/m);              % Natural frequency of vibratoin
dt_crit = 2*sqrt(m/k);          % Critical time step
dt = dt_crit*(1/resolution);    % Critical time step with a resolution factor added. 
v   = [];
d   = [];
d(1)= 0;
v(1)= A*omega;
d(2)= d(1) + dt*v(1);
v(2)= v(1) - 0.5*dt*k*d(2)/m;
time = 0:dt:b*pi*dt_crit;
n = 2;
for i = 1:length(time)-1    
    d(i+1) = d(i) + dt*v(i) - dt^2*k*d(i)/m;
    v(i+1) = v(i) - dt*k*d(i)/m;
end
end