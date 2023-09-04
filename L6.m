% Value of A = 2
% Value of B = 1
% Value of C = 4
% Value of D = 5
% Value of E = 4 //
% Value of F = 4 //
% Value of G = 6 //
% Value of H = 3

f=5;
f2=10;
x=[0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 1 1 0] % input signal sl 34, Md. Amir Hossain Alif ;

nx=size(x,2);
i=1;
while i<nx+1
 t = i:0.001:i+1;
 if x(i)==1
 ask=(sin(2*pi*f*t))+3.5;
 fsk=sin(2*pi*f*t)+4;
 psk=sin(2*pi*f*t);
 else
 ask=0*(sin(2*pi*f*t))+3.5;
 fsk=sin(2*pi*f2*t)+4;
 psk=sin(2*pi*f*t+pi);
 end
 subplot(3,1,1);
 plot(t,ask);
 hold on;
 grid on;
 axis([1 26 0 7]);
title('Amplitude Shift Key')
 subplot(3,1,2);
 plot(t,fsk);
 hold on;
 grid on;
 axis([1 26 1 8]);
title('Frequency Shift Key')
 subplot(3,1,3);
 plot(t,psk);
 hold on;
 grid on;
 axis([1 26 -((3*pi)/4) (pi/2)]);
title('Phase Shift Key')
 i=i+1;
end