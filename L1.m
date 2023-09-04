A = 2; B = 1; C = 4; D = 5; E = 4; F = 4; G = 6; H = 3;

K1 = A + B;
K2 = G + H + 2;

J1 = D + G + 20;
J1_radians = J1 * pi/180;
J2 = 30 * pi/180;

t = 0:0.003:0.215;

x1 = K1 * cos(2*pi*(E+F+5)*t + J1_radians);
x2 = K2 * cos(2*pi*(C+D+5)*t + J2);

plot(t, x1);
plot(t, x2);

x3 = x1 + x2;
plot(t, x3);

subplot(3, 1, 1);
plot(t, x1);
xlabel = ('t');
ylabel = ('x1');
title ('SL: 34, ID: 21-45446-3, Name: Md. Amir Hossain Alif');
subplot(3, 1, 2);
plot(t, x2);
xlabel = ('t');
ylabel = ('x1');
subplot(3, 1, 3);
plot(t, x3);
xlabel = ('t');
ylabel = ('x1');