clc;
clear all;
close all;
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
% Calculate the SNR
pow_signal = sum(x.^2) / length(x);
pow_noise = sum(s^2) / length(x);
SNR = 10*log10(pow_signal/pow_noise)
% Display SNR value SNR