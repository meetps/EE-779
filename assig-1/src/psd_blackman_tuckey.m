function [blt32, blt128] = psd_blackman_tuckey(signal, fft_length)

%% Blackman-Tukey Method
% Periodogram Smoothing by windowing the signal using a Bartlett Window

r =  xcorr(signal, 'biased');

% M = 32
M=32;
w = zeros(length(r),1);
% 512 to the length of the signal
w(512-M : 512+M) = bartlett(2*M + 1); 

rz = zeros(fft_length,1);
%Zero padding
rz(1:length(r)) = r' .* w;
blt32 = abs(fftshift(fft(rz,fft_length)));

% M = 128
M=128;
w = zeros(length(r),1);
w(512-M : 512+M) = bartlett(2*M + 1); 

rz = zeros(fft_length,1);
%Zero padding
rz(1:length(r)) = r' .* w;
blt128 = abs(fftshift(fft(rz,fft_length)));