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
% Data rate in bits per second (bps)
data_rate = 100000; % Specify the desired data rate
% Calculate the required signal level
bit_duration = 1 / data_rate; % Duration of one bit
total_duration = 1; % Total duration of the signal
num_bits = round(data_rate * total_duration); % Total number of bits
t = linspace(0, total_duration, num_bits); % Time vector
% Generate the signal at the desired data rate
x = A1 * sin(2*pi*((C+D+H)*100)*t) + A2 * cos(2*pi*((D+E+H)*100)*t) + s * randn(size(t));
% Perform signal level adjustment to achieve the desired data rate
desired_energy = bit_duration; % Energy per bit (assuming unity energy per bit)
current_energy = sum(x.^2) / length(x); % Energy of the generated signal
adjustment_factor = sqrt(desired_energy / current_energy); % Signal level adjustment factor
adjusted_x = x * adjustment_factor; % Adjusted signal
% Calculate the adjusted signal level
adjusted_pow_signal = sum(adjusted_x.^2) / length(adjusted_x);
% Display the adjusted signal level
disp(['Adjusted Signal Level: ' num2str(adjusted_pow_signal)]);
% Plot the adjusted signal (optional)
figure;
plot(t, adjusted_x);
xlabel('Time');
ylabel('Amplitude');
title('Adjusted Signal.....SL: 34, ID: 21-45446-3');
Adjusted Signal Level: 1e-05