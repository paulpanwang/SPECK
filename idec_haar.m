function in=idec_haar(in,N)
% N level  Haar wavelet reconstruction
% in = wavelet coefficients
% out= wavelet reconstruction image

[m,n]=size(in);
for i=N:-1:1
    LL=in(1:m/2^(i-1),1:n/2^(i-1));
    [R]=haar_idwt2D(LL);
    in(1:m/2^(i-1),1:n/2^(i-1))=R;
end
