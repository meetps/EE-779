function psd_MUSIC = MUSIC_spectrum(x,M,P,K)

pm = 8;
y1m = [zeros(pm,1);x;zeros(pm,1)];
N = 32;

Y1m = zeros(N, pm);
for i=1:N+pm,
    for j=1:pm,
        Y1m(i, j) = y1m(pm+i-j);
    end
end
N1=pm+1; N2=N;
Ycm = Y1m(N1:N2,:);
[V D] = eig(Ycm'*Ycm);
Vn = V(:,1:5);
psd_MUSIC=zeros(1024, 1);
for k=0:1023,
    w = k/1024 * 2 * pi;
    expo = [1; exp(1i*w); exp(2i*w); exp(3i*w); exp(4i*w); exp(5i*w); exp(6i*w); exp(7i*w)];
    psd_MUSIC(k+1) = 1/sum(abs(expo'*conj(Vn)).^2);
end
end