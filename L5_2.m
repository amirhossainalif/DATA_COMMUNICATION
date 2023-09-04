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
subplot(1,2,1)
plot(t, sig, 'linewidth', 1.5)
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Analog signal')
%% Sampling Frequency
fs = 250;
ts = 1/fs;
%% Sampling
samp_t = 0:ts:time_duration;
samp_sig = (F + 1)*sin(2*pi*(G + 5)*samp_t) + (F + 3)*cos(2*pi*(G + 7)*samp_t) + (F + 2)*sin(2*pi*(G + 1)*samp_t) + (F + 4)*sin(2*pi*(G + 2)*samp_t);
subplot(1,2,2)
plot(samp_t, samp_sig, 'o', 'linewidth', 1.5)
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Sampled signal')
%% Levels for Quantization
L = 8;
%% Quantizing
delta = (max(samp_sig) - min(samp_sig))/(L-1); % step size
quant_sig = min(samp_sig) + round((samp_sig - min(samp_sig))/delta) * delta; % quantized signal
figure
subplot(1,2,1)
plot(samp_t, quant_sig, 'x', 'linewidth', 1.5);
grid on
xlabel('time in seconds')
ylabel('amplitude')
title('Quantized signal')
%% Number of Bits/Sample
nb = log2(L);
%% Encoding
i = round((samp_sig - min(samp_sig))/delta); % index for encoding
dig_data_matrix = de2bi(i, nb); % encoded binary bits are stored in a matrix here
dig_data = reshape(dig_data_matrix', 1, []); % encoded binary bits are stored in an array here
disp(['The index values for encoding from quantization of the sampled signal are: ', num2str(i)])
disp(['The converted bits from the input analog signal are: ', num2str(dig_data)])

