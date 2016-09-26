%% EE 779 : Assignment 2 | Q-1
% Meet Pragnesh Shah, 13D070003
%%

close all;	
clear all;

S = getdata('../data/S01.DAT');
N = length(S);

% AR model order = 2 as we are using a 3*3 corr matrix
p = 2;
r = zeros(p+1, 1);
for i = 0:p,
    r(i+1) = S(1:N-i)*S(i+1:N)'/N;
end

% Forming the toepltiz matrix
R33 = [r(1) r(2) r(3); 
	   r(2) r(1) r(2); 
	   r(3) r(2) r(1)]

%% b) Yule-Walker Method for 2nd Order AR
% From LP and solve for AR coeefs from Toeplitz matix entries 
%%

R331=R33(2:end, 2:end);
a33 = zeros(p,1);
a33 = -inv(R331)*r(2:end)
a331 = [1;a33];


%%
% The theoretical variance comes out to be:
%%
var33th = a331'*r;
disp(['The theoretical variance for 2nd order model :', num2str(var33th)]);
disp('2nd order AR model params:');
disp(a331);

%% c) Prediction Error Variance
e33 = zeros(N,1);
e33(1) = S(1);
e33(2) = S(2) + a33(1)*S(1);
for i=3:N,
    e33(i) = S(i) + a33(1)*S(i-1) + a33(2)*S(i-2);
end
var33pr = var(e33);
disp(['The predicted error variance for 2nd order model :', num2str(var33pr)]);

%%
% It compares quite well to the theoretical error variance
%%

%% d) First order linear predictive model
% We solve the YW equations from the upper (p-1)*(p-1)
% block of the toeplitz and solve for (order-1) AR model 
% and obtain the model params and variances.
%%
R22 = R33(1:2, 1:2);
a22 = -r(2)/R22(2,2);
a221 = [1;a22];
var22th = a221'*r(1:2);

%%
% The theoretical variance comes out to be:
%%
disp(['The theoretical variance for 2nd order model :', num2str(var22th)]);
disp('1st order AR model params:');
disp(a221);

e22=zeros(N,1);
e22(1) = S(1);

for i=2:N,
    e22(i) = S(i) + a22*S(i-1);
end
%%
% Actual value of error variance (using difference equation)
%%
var22pr = var(e22);
disp(['The predicted error variance for 2nd order model :', num2str(var22pr)]);

%%
%% e) 1st Order AR Power Spectral estimate 
% We obtain the psd estimate from the AR model params 
%% 

Pspec22=zeros(512, 1);
for k=0:512,
    w = k/512 * 2 * pi;
    expo = [1; exp(-1i*w)];
    Pspec22(k+1) = var22th/abs(expo'*a221);
end
figure;
plot(Pspec22);
title('1st Order AR Power Spectrum');
xlabel('n(1:512)');
xlim([0 512]);

%% f) 2nd Order AR Power Spectral esimate

Pspec33 = zeros(512, 1);
for k = 0:512,
    w = k/512 * 2 * pi;
    expo = [1; exp(-1i*w); exp(-2i*w)];
    Pspec33(k+1) = var33th/abs(expo'*a331);
end
figure;
plot(Pspec33)
title('2nd Order AR Power Spectrum');
xlabel('n(1:512)');
xlim([0 512]);

%% g) Power spectrum using best periodogram method | Blackman-Tuckey

per1 = blackman_tuckey_spectrum(S, rectwin(32), 512);
figure;
plot(per1)
title('Periodogram (Blackman-Tuckey) using Rectangular Window');
xlabel('n(1:512)');
xlim([0 512]);
%%
% Using Hamming Window of length 32
%%
per2 = blackman_tuckey_spectrum(S, hamming(32), 512);
figure;
plot(per2)
title('Periodogram (Blackman-Tuckey) using Hamming Window');
xlabel('n(1:512)');
xlim([0 512]);
%%
% Comparison of periodogram estimates
%%