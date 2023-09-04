% Value of A = 2
% Value of B = 1
% Value of C = 4
% Value of D = 5
% Value of E = 4
% Value of F = 4
% Value of G = 6
% Value of H = 3
bit_stream = [0 1 0 0 0 1 0 0 0 1 1 0];
no_bits = length(bit_stream);
bit_rate = 5000;
pulse_per_bit = 1;
pulse_duration = 1;
no_pulses = no_bits*pulse_per_bit;
samples_per_pulse = 500;
fs = (samples_per_pulse)/(pulse_duration);
t = 0:1/fs:(no_pulses)*(pulse_duration);
no_samples = length(t);
dig_sig = zeros(1,no_samples);
max_voltage = +2;
avg_voltage=0;
min_voltage = -2;
inv_bit=1;
for i = 1:no_bits
if bit_stream(i) == 1
if inv_bit == 1
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse))=max_voltage*ones(1,samples_per_pulse);
inv_bit=0;
else
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse))=min_voltage*ones(1,samples_per_pulse);
inv_bit=1;
end
else
dig_sig(((i-1)*(samples_per_pulse)+1):i*(samples_per_pulse))=avg_voltage*ones(1,samples_per_pulse);
end
end
figure
plot(t,dig_sig,'linewidth',1.5)
grid on
xlabel('time in seconds')
ylabel('Voltage')
ylim([(min_voltage - (max_voltage)*0.2) (max_voltage+max_voltage*0.2)])
title(['SL: 34, ID 21-45446-3.....AMI for ',num2str(bit_stream),''])

