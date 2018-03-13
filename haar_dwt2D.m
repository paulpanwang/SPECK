 function [LL LH HL HH]=haar_dwt2D(img)
[m n]=size(img);
% Row transform
for i=1:m
    [L H]=haar_dwt(img(i,:));
    img(i,:)=[L H];
end

%Col trandform
for j=1:n
    [L H]=haar_dwt(img(:,j));
    img(:,j)=[L H];
end
    
LL=img(1:m/2,1:n/2);
LH=img(1:m/2,n/2+1:n);
HL=(img(m/2+1:m,1:n/2));
HH=(img(m/2+1:m,n/2+1:n));



