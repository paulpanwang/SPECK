function [R]=haar_idwt(f)
n=length(f);
n=n/2;
L=f(1:n);
H=f(n+1:2*n);
for i=1:n
    R(2*i-1)=sqrt(2)*(L(i)+H(i))/2;
    R(2*i)=sqrt(2)*(L(i)-H(i))/2;
end
end
    
