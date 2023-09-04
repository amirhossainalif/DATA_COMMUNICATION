% Signal parameters
A = 2; B = 1; C = 4; D = 5; E = 4; F = 4; G = 6; H = 3;

% Calculate amplitudes and frequencies
a1 = A + C + 1;
a2 = A + D + 2;
a3 = A + E + 1;
f1 = A + E + 1;
f2 = A + D + 2;
f3 = A + C + 1;

% Time domain representation
fs = 1000;  % Sampling frequency
t = linspace(0, 1, fs);
x1 = a1 * cos(2*pi*f1*t);
x2 = a2 * sin(2*pi*f2*t);
x3 = a3 * cos(2*pi*f3*t);

signal_x = x1 + x2 + x3;

% Frequency domain representation
N = length(signal_x);
frequencies = linspace(-fs/2, fs/2, N);
signal_X = fftshift(fft(signal_x, N));

% Plotting the signals
figure;

% Time domain plot
subplot(2, 1, 1);
plot(t, signal_x);
title('Time Domain Representation..SL: 34, ID: 21-45446-3, Name: Md. Amir Hossain Alif');
xlabel('Time');
ylabel('Amplitude');
axis tight;

% Frequency domain plot
subplot(2, 1, 2);
plot(frequencies, abs(signal_X));
title('Frequency Domain Representation......SL: 34, ID: 21-45446-3, Name: Md. Amir Hossain Alif');
xlabel('Frequency');
ylabel('Magnitude');
axis tight;

% Quantization
num_levels = 8;
quantized_signal = linspace(min(signal_x), max(signal_x), num_levels);
quantized_signal = interp1(quantized_signal, quantized_signal, signal_x, 'nearest');

% Plotting the quantized signal
figure;
subplot(2, 1, 1);
plot(t, signal_x);
title('Original Signal......SL: 34, ID: 21-45446-3, Name: Md. Amir Hossain Alif');
xlabel('Time');
ylabel('Amplitude');
axis tight;

subplot(2, 1, 2);
plot(t, quantized_signal);
title('Quantized Signal......SL: 34, ID: 21-45446-3, Name: Md. Amir Hossain Alif');
xlabel('Time');
ylabel('Amplitude');
axis tight;