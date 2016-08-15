function [blt32, blt128] = psd_blackman_tuckey(signal)

%% Blackman-Tukey Method
% Periodogram Smoothing by windowing the signal using a Bartlett Window

r =  xcorr(signal, 'biased');

M=32;
w = bartlett(256);
rz = zeros(256,1);
%Zero padding
rz(1:1+M-1) = r(512:512+M-1);
rw = rz.*w;
blt32 = real(fft(rw));

M=128;
w = bartlett(256);
rz = zeros(256,1);
%Zero padding
rz(1:1+M-1) = r(512:512+M-1);
rw = rz.*w;
blt128 = real(fft(rw));