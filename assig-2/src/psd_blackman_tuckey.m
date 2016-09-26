function blt32 = psd_blackman_tuckey(signal, M, fft_length)

%% Blackman-Tukey Method
% Periodogram Smoothing by windowing the signal using a Bartlett Window

cr =  xcorr(signal, 'biased');
w = zeros(length(cr),1);

% 512 to the length of the signal
w(512-M : 512+M) = bartlett(2*M + 1); 

rz = zeros(fft_length,1);
%Zero padding
rz(1:length(cr)) = cr .* w;
blt32 = abs(fftshift(fft(rz,fft_length)));
end