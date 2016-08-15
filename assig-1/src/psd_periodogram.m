function [per16, per32, per128, per512] = psd_periodogram(signal)
%% Periodogram Method
%%
% N = 16
%%
N = 16;
y = zeros(256,1);
y(1:N) = signal(1:N);
temp = abs(fft(y)).^2;
per16 = temp/N;
%%
% N = 32
%%
N = 32;
y = zeros(256,1);
y(1:N) = signal(1:N);
temp = abs(fft(y)).^2;
per32 = temp/N;
%%
% N = 128
%%
N = 128;
y = zeros(256,1);
y(1:N) = signal(1:N);
temp = abs(fft(y)).^2;
per128 = temp/N;
%%
% N = 512
%%
N = 512; 
temp = abs(fft(signal, N)).^2;
per512 = temp/N;