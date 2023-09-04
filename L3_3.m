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
% Calculate the bandwidth of the signal
bandwidth = obw(x, fs);
% Calculate the maximum capacity of the channel
SNR = snr(x, s*randn(size(t))); % Calculate SNR
C = bandwidth * log2(1 + SNR) % Maximum capacity of the channel bandwidth C