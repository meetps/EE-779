function [wel32, wel128] = psd_welch(signal)
%%
%% Welch's Method
% Similar to Bartlett's method but using overlapping subsequences with
% overlap=L/2 where L may be 32 or 128 using Bartlett Windows for signal smoothing.
%%

L = 32;
D = L/2;
K = fix((512-L)/D+1);
%w = bartlett(256);
w = bartlett(L);
P = mean(w.^2);
sum = zeros(256, 1);
for i=1:K
    temp = signal((1+(i-1)*D):(L+(i-1)*D));
    sum = sum + abs(fft(temp'.*w, 256)).^2;
end
wel32 = sum/(K*L*P);

L = 128;
D = L/2;
K = fix((512-L)/D+1);
%w = bartlett(256);
w = bartlett(L);
P = mean(w.^2);
sum = zeros(256, 1);
for i=1:K
    temp = signal((1+(i-1)*D):(L+(i-1)*D));
    sum = sum + abs(fft(temp'.*w, 256)).^2;
end
wel128 = sum/(K*L*P);