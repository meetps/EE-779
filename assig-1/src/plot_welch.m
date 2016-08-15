function plot_welch(wel32, wel128)

figure(2);
subplot(2,1,1);
plot(wel32);
title('Welch''s Method (L=32)');
xlabel('w');
subplot(2,1,2);
plot(wel128);
title('Welch''s Method (L=128)');
xlabel('w');