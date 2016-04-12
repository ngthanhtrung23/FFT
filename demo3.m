clear all; close all;

% Read the image
A = imread('test', 'jpg'); Abw = rgb2gray(A);
subplot(2, 2, 1), imshow(uint8(Abw)), freezeColors

% Convert from integer to double & add noise
Abw = double(Abw) + 50*randn(size(Abw, 1), size(Abw, 2));
subplot(2, 2, 2), imshow(uint8(Abw)), freezeColors

% Fourier transform
Abwt = fftshift(fft2(Abw));
subplot(2, 2, 3)
pcolor(log(abs(Abwt))), shading interp, colormap(hot), freezeColors


% FILTER
kx = 1:size(A, 2); ky = 1:size(A, 1);
[KX, KY] = meshgrid(kx, ky);
F = exp(-0.0001*(KX-size(A, 2) / 2).^2 - 0.0001*(KY-size(A, 1) / 2).^2);

Abwtf = Abwt .* F;
pcolor(log(abs(Abwtf))), shading interp, colormap(hot), freezeColors

% Reconstruct image
Abwf = ifft2(fftshift(Abwtf));
subplot(2, 2, 4), imshow(rgb2gray(A))
