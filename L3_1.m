clc
clear all
close all
% Constants
A = 2; % Value of A
B = 1; % Value of B
C = 4; % Value of C
D = 5; % Value of D
E = 4; % Value of E
F = 4; % Value of F
G = 6; % Value of G
H = 3; % Value of H
% Calculate amplitudes
A1 = A + B + H;
A2 = B + C + H;
s = (C + D + H) / 30;
% Sampling frequency and time duration
fs = 8000;
t = 0:1/fs:1-1/fs;
% Generate composite signal
x = A1*sin(2*pi*((C+D+H)*100)*t) + A2*cos(2*pi*((D+E+H)*100)*t) + s*randn(size(t));
% Plot the composite signal figure
plot(t, x, 'linewidth', 1.5)
grid on
xlabel('Time (seconds)')
ylabel('Amplitude')
title('Composite Signal....SL: 34, ID: 21-45446-3')