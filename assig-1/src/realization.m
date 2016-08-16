function [ y,r ] = realization()
rho = 0.95;
len = 512;
power_db = 0;
v = wgn(len,1,power_db);
y = zeros(len,1);
y(1) = v(1);
for i = 2:len
    y(i) = v(i) + rho*y(i-1);
end
y = y - mean(y);
y = y';
r = find_correlation(y,'biased');
end