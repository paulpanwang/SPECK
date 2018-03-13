% speck���룻С���任����mallatС���任
%levelΪС���任������
%smΪspeck����ʱ��ɨ�������

clear all;
clc;
close all;

%��ȡͼ��
X0=imread('img1.bmp');
subplot(1,2,1);
imshow(X0);title('ԭ����ͼ��');

X0=double(X0);
[imgsize,col]=size(X0);
level=6;  %С���任����
X1=mallatdec2(X0,'sym2',level);  %С���ֽ�
% X1=dec_haar(X0,level);  %haarС���任


sm=9;
[lineout,T0,Arow,ratio]=speckencode(X1,level,sm); %speck����

X2=speckdecode(lineout,X1,T0,Arow,level,sm);%speck����
ratio1=imgsize^2*8/ratio;  %ѹ����
display(ratio1);

X3=mallatrec2(X2,'sym2',level);%С���ϳ�
% X3=idec_haar(X2,level); %haarС���ع�

PSNR=psnr(X0,X3) %����PSNRֵ
IPSNR=1-1/(1+exp(0.1701*(PSNR-18.6675)))
SSIM = ssim(X0,X3)
IAM0=LoadIAM2(X0)
IAM=LoadIAM2(X3)

a(1)=ratio1;
a(2)=PSNR;
a(3)=SSIM;
a(4)=IAM;
X4=uint8(X3);
subplot(1,2,2);
imshow(X4)
title(['ѹ�����ʣ� ',num2str(ratio1)]);



