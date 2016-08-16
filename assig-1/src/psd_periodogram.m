function [per128, per512] = psd_periodogram(signal, fft_length)

%% Periodogram Method
% N = 128
%%
N = 128;
y = zeros(fft_length,1);
y(1:N) = signal(1:N);
temp = abs(fftshift(fft(y, fft_length)).^2);
per128 = temp/N;
%%
% N = 512
%%
N = 512; 
y(1:N) = signal(1:N);
temp = abs(fftshift(fft(signal(1:N), fft_length))).^2;
per512 = temp/N;
