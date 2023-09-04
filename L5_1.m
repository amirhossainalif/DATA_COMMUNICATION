clc
clear all
close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Analog to Digital Conversion
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
time_duration = 0.2;
% Variables A, B, C, D, E, F, G, H
A = 2;
B = 1;
C = 4;
D = 5;
E = 4;
F = 4;
G = 6;
H = 3;
%% Analog-like signal's representation
% Analog signal generation is not possible in MATLAB
% Signal equation
t = 0:0.0001:time_duration;
sig = (F + 1)*sin(2*pi*(G + 5)*t) + (F + 3)*cos(2*pi*(G + 7)*t) + (F + 2)*sin(2*pi*(G + 1)*t) + (F + 4)*sin(2*pi*(G + 2)*t);
figure
subplot(1,3,1)
plot(t, sig, 'linewidth', 1.5)
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Analog signal.....SL: 34, ID: 21-45446-3')
%% Sampling Frequency
fs = 250;
ts = 1/fs;
%% Sampling
samp_t = 0:ts:time_duration;
samp_sig = (F + 1)*sin(2*pi*(G + 5)*samp_t) + (F + 3)*cos(2*pi*(G + 7)*samp_t) + (F + 2)*sin(2*pi*(G + 1)*samp_t) + (F + 4)*sin(2*pi*(G + 2)*samp_t);
subplot(1,3,2)
plot(samp_t, samp_sig, 'o', 'linewidth', 1.5)
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Sampled signal.....SL: 34, ID: 21-45446-3')
%% Levels for Quantization
L = 8;
%% Quantizing
delta = (max(samp_sig) - min(samp_sig))/(L-1); % step size 
quant_sig = min(samp_sig) + round((samp_sig - min(samp_sig))/delta) * delta; % quantized signal
subplot(1,3,3)
plot(samp_t, quant_sig, 'x', 'linewidth', 1.5);
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Quantized signal.....SL: 34, ID: 21-45446-3')