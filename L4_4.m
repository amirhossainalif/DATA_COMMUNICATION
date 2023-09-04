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
bit_rate = 10000;
pulse_per_bit =1;
pulse_duration = 1;
no_pulses = no_bits*pulse_per_bit;
samples_per_pulse = 500;
fs = (samples_per_pulse)/(pulse_duration);
t = 0:1/fs:(no_pulses)*(pulse_duration);
no_samples = length(t);
dig_sig = zeros(1,no_samples);
max_voltage =+2;
min_voltage =-2;
neutral_volt=0;
last_state=neutral_volt;
prev_last_state=min_voltage;
for i = 1:no_bits
if bit_stream(i) == 1
if last_state==max_voltage
dig_sig(((i-1)*(samples_per_pulse)+1):(i*samples_per_pulse)) = neutral_volt*ones(1,samples_per_pulse);
last_state=neutral_volt;
prev_last_state=max_voltage;
elseif last_state==min_voltage
dig_sig(((i-1)*(samples_per_pulse)+1):(i*samples_per_pulse))=neutral_volt*ones(1,samples_per_pulse);
last_state=neutral_volt;
prev_last_state=min_voltage;
else
if prev_last_state==max_voltage
dig_sig(((i-1)*(samples_per_pulse)+1):(i*samples_per_pulse))=min_voltage*ones(1,samples_per_pulse);
last_state=min_voltage;
prev_last_state=neutral_volt;
else
dig_sig(((i-1)*(samples_per_pulse)+1):(i*samples_per_pulse))=max_voltage*ones(1,samples_per_pulse);
last_state=max_voltage;
prev_last_state=neutral_volt;
end
end
else
dig_sig(((i-1)*(samples_per_pulse)+1):(i*samples_per_pulse))=last_state*ones(1,samples_per_pulse);
end
end
plot(t,dig_sig,'linewidth',1.5)
grid on
xlabel('time in seconds')
ylabel('Voltage')
ylim([(min_voltage - (max_voltage)*0.2)
(max_voltage+max_voltage*0.2)])
title(['SL: 34, ID 21-45446-3..... MLT-3 bits: ',num2str(bit_stream),''])