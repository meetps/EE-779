function psd_covar = AR_covariance_spectrum(x,p,K)

y1 = [zeros(p,1);x;zeros(p,1)];
N = 32;

Y1 = zeros(N, p);
for i=1:N+p,
    for j=1:p,
        Y1(i, j) = y1(p+i-j);
    end
end

N1=p+1; N2=N;

yc = y1(N1+p:N2+p);
Yc = Y1(N1:N2,:);
theta_c = -inv(Yc'*Yc)*Yc'*yc;

psd_covar=zeros(1024, 1);
for k=0:1023,
    w = k/1024 * 2 * pi;
    expo = [1; exp(-1i*w); exp(-2i*w); exp(-3i*w); exp(-4i*w); exp(-5i*w); exp(-6i*w); exp(-7i*w)];
    psd_covar(k+1) = 1/abs(expo'*[1;theta_c])^2;
end