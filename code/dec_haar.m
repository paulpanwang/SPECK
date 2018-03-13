function out=dec_haar(in,N)
% N level Haar wavelet decomposition
% in = input image
% out=wavelet coefficients

img=[];
LL=in;
out=[];
[m,n]=size(in);
for i=1:N
    img=LL;
    [LL LH HL HH]=haar_dwt2D(img);
    img=[LL LH;HL HH]; 
    out(1:m/2^(i-1),1:n/2^(i-1))=img;
end