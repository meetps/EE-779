%% EE 779 : Assignment 1
% Meet Pragnesh Shah, 13D070003
%%

% Reading the signal from DAT file
signal = getdata('../data/S01.DAT');

%% Periodogram Method
[per16, per32, per128, per512] = psd_periodogram(signal);

% Plotting
plot_periodogram(per16, per32, per128, per512);

%% Welch method
[wel32, wel128 ] = psd_welch(signal);

% Plotting
plot_welch(wel32, wel128);

%% Blackman-Tuckey method
[blt32, blt128 ] = psd_blackman_tuckey(signal);

% Plotting
plot_blackman_tuckey(blt32, blt128);

%% Comparing estimates with ground truth
sig = 1;
rho = 0.95;
autocor = zeros(256,1);


for i=1:256
	autocor(i) = (sig/(1 - rho^2))*(rho^i);
end
autocor_pad = [autocor zeros(256,1)];
figure(4);
plot(abs(fft(autocor_pad)).^2) 