clear all; close all;
n = 1024; L = 20; x2 = linspace(-L/2, L/2, n+1); x = x2(1:n);

% f1
f1 = 1*sin(2*pi*50*x);
subplot(4, 1, 1), plot(x, f1), axis([-10 10 -2 2])

% f2
f2 = 1.5*sin(2*pi*100*x);
subplot(4, 1, 2), plot(x, f2), axis([-10 10 -2 2])

% f1 + f2
subplot(4, 1, 3), plot(x, f1 + f2), axis([-10 10 -2 2])

% fft(f1 + f2)
subplot(4, 1, 4), plot(abs(fft(f1 + f2))), axis([0 200 0 600])
