function plot_blackman_tuckey(blt32, blt128)

figure('units','normalized','outerposition',[0 0 1 1]);
plot(blt32);
title('Blackman-Tukey (M=32)');
xlabel('Unnormalized Frequency w');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(blt128);
title('Blackman-Tukey (M=128)');
xlabel('Unnormalized Frequency w');