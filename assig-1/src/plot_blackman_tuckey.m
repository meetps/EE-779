function plot_blackman_tuckey(blt32, blt128)

figure(3);
subplot(2,1,1);
plot(blt32);
title('Blackman-Tukey (M=32)');
xlabel('w');
subplot(2,1,2);
plot(blt128);
title('Blackman-Tukey (M=128)');
xlabel('w');