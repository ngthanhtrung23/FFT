% Everything in frequency domain

clear all; close all;
L = 30;						                % time slot to transform
n = 512;					                % number of Fourier modes 2^9
t2 = linspace(-L, L, n+1); t = t2(1:n);		% time discretization
k=(2*pi/(2*L))*[0:(n/2-1) -n/2:-1];		    % frequency components of FFT

% Ideal signal
u = sech(t);					            % Ideal signal in time domain
figure(1), 
subplot(4, 1, 1), plot(t, u, 'k')

% Add white noise + Generate new signal
noise = 10;
ut = fft(u);
utn = ut + noise*(randn(1,n)+i*randn(1,n));	% Add white noise
un=ifft(utn);					            % Generate actual signal
figure(1), 
subplot(4, 1, 2), plot(t,abs(un),'k')

% Filter
filter = exp(-0.2*k.^2);			        % Create a filter
unft = filter .* utn;			            % Apply the filter
unf = ifft(unft);				            % Transform back to time domain
subplot(4, 1, 3), plot(t, unf, 'k', t, fftshift(filter), 'm')

% Filter wrong point
filter = exp(-0.2*(k - 4).^2);			    % Create a filter
unft = filter .* utn;			            % Apply the filter
unf = ifft(unft);				            % Transform back to time domain
subplot(4, 1, 4), plot(t, unf, 'k', t, fftshift(filter), 'm')
