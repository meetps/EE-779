function realize_process(n_iter, fft_length)

fig1 = figure('units','normalized','outerposition',[0 0 1 1]);
fig2 = figure('units','normalized','outerposition',[0 0 1 1]);
rho = 0.95;

for iteration = 1:n_iter
	% Generating random white gaussian noise
	y = zeros(fft_length/2,1);
	noise = wgn(fft_length/2,1,0);
	 
	% Primary Initalization
	y(1) = noise(1);
	% Difference eqution implementation
	for i = 2:fft_length/2
		y(i) = noise(i) + rho*y(i-1);
	end
	y = (y - mean(y))';
	r = xcorr(y,'biased');
	 
	% Plotting Signal 
	figure(fig1);
	t = [0:length(y)-1];
	plot(t,y);
	title('Function Realization');
	ylabel('x');
	xlabel('n');
	hold on;
	 
	% Plotting Autocorrelation
	figure(fig2);
	t = [-(length(r)-1)/2:(length(r)-1)/2];
	plot(t,r);
	title('Autocorrelation Realizations');
	ylabel('autocorr');
	xlabel('n');
	hold on;
end