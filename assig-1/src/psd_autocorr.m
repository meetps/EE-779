function [psd_acorr, rx] = psd_autocorr(fft_length, sig, rho)

rx_padded = zeros(fft_length, 1);
rx = zeros(fft_length-1, 1);
num_by_denom = (sig^2)/(1-rho^2);
rx(fft_length/2) = num_by_denom;

% calculating autocorrelation
for i = 1:(fft_length)/2 - 1
	l = (fft_length)/2 - i;
	rx(i) = num_by_denom*rho^l;
	rx(fft_length - i) = rx(i);
end

rx_padded(1:fft_length-1) = rx;
psd_acorr = abs(fftshift(fft(rx_padded, fft_length))).^2;