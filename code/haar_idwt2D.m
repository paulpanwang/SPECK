function [R]=haar_idwt2D(img)
[m n]=size(img);

for i=1:m
    [L1]=haar_idwt(img(i,:));
    img(i,:)=[L1];
end
for j=1:n
   [L2]=haar_idwt(img(:,j));
    img(:,j)=[L2];
end
R=img;


    
