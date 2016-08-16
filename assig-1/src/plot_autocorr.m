function plot_autoccorr(psd_autocorr, rx)

figure('units','normalized','outerposition',[0 0 1 1]);
plot(psd_autocorr);
title('PSD from autocorr (N = 1023)');
xlabel('Unnormalized Frequency w');
ylabel('PSD from Autocorrelation')

% PLotting Autocorrelation
figure('units','normalized','outerposition',[0 0 1 1]);
t = [-(length(rx)-1)/2:(length(rx)-1)/2];
plot(t,rx);
title('Autocorrelation function');
xlabel('l (index)');
ylabel('Autocorrelation')