function plot_periodogram(per128, per512)
	
figure('units','normalized','outerposition',[0 0 1 1]);
plot(per128);
title('Periodogram (N=128)');
xlabel('Unnormalized Frequency w');
ylabel('N=128 Periodogram');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(per512);
title('Periodogram (N=512)');
xlabel('Unnormalized Frequency w');
ylabel('N=512 Periodogram');