function plot_welch(wel32, wel128)

figure('units','normalized','outerposition',[0 0 1 1]);
plot(wel32);
title('Welch''s Method (L=32)');
xlabel('Unnormalized Frequency w');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(wel128);
title('Welch''s Method (L=128)');
xlabel('Unnormalized Frequency w');