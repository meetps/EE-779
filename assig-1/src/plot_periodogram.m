function plot_periodogram(per16, per32, per128, per512)
	
figure(1)
subplot(2,2,1);
plot(per16);
xlabel('w');
ylabel('N=16 Periodogram');
subplot(2,2,2);
plot(per32);
xlabel('w');
ylabel('N=32 Periodogram');
subplot(2,2,3);
plot(per128);
xlabel('w');
ylabel('N=128 Periodogram');
subplot(2,2,4);
plot(per512);
xlabel('w');
ylabel('N=512 Periodogram');