clc
clear all
close all
% Minimum required SNR (in dB) and bandwidth of the channel
SNR_dB = 25; % Minimum required SNR in dB
B = 150; % Bandwidth of the channel in Hz
% Calculating the appropriate sampling frequency (fs)
fs = 2 * B; % Nyquist-Shannon sampling theorem
% Calculating the appropriate number of levels of quantization (L)
SNR_linear = 10^(SNR_dB/10);
L = round(2^(2 * SNR_linear));
% Displaying the results
disp(['Appropriate sampling frequency (fs): ', num2str(fs), ' Hz']);
disp(['Appropriate number of levels of quantization(L): ', num2str(L)]);