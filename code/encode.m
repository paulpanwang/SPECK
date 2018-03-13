% speck编码；小波变换采用mallat小波变换
%level为小波变换层数；
%sm为speck编码时的扫描次数；

clear all;
clc;
close all;

%读取图像
X0=imread('img1.bmp');
subplot(1,2,1);
imshow(X0);title('原来的图形');

X0=double(X0);
[imgsize,col]=size(X0);
level=6;  %小波变换级数
X1=mallatdec2(X0,'sym2',level);  %小波分解
% X1=dec_haar(X0,level);  %haar小波变换


sm=9;
[lineout,T0,Arow,ratio]=speckencode(X1,level,sm); %speck编码

X2=speckdecode(lineout,X1,T0,Arow,level,sm);%speck解码
ratio1=imgsize^2*8/ratio;  %压缩比
display(ratio1);

X3=mallatrec2(X2,'sym2',level);%小波合成
% X3=idec_haar(X2,level); %haar小波重构

PSNR=psnr(X0,X3) %计算PSNR值
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
title(['压缩比率： ',num2str(ratio1)]);



