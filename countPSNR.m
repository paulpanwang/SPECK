function PSNR=countPSNR(X1,X2)
%ͳ��PSNRֵ,X1Ϊԭͼ�����,X2Ϊ�任�����
err=double(X1)-double(X2);
[Xrow,Xcol]=size(X1);
Xmax=max(max(abs(double(X1))));
Xsum=sum(sum(err.^2));
PSNR=10*log10(Xrow*Xcol*Xmax^2/Xsum);

