function S=psnr(Img_s,Img_p)
%  S=PSNR(Im_original,Im_modified);
%  use this function to cal PSNR
%  Im_original: the input gray image. (orginal)
%  Im_modified:the input gray image. (modified)
%  S is the output PSNR score.
%  phil  2006-3-18
 if  (size(Img_s)~=size(Img_p))
     errordlg('error, the two image is not coherent','error!');
 end
 
 %if (~isrgb(Img_s)&~isrgb(Img_p))
     if  (islogical(Img_s)) 
         Img_s=double(Img_s)*255;   % use to change to 255 gray level
     elseif (islogical(Img_p)) 
         Img_p=double(Img_p)*255; % use to change to 255 gray level
     end     
     Orig=double(Img_s);   % use to save the input orginal image
     Modify=double(Img_p); % use to save the input modified image
     PeakMax=max(max(Orig.^2));
     I=(Orig-Modify).^2;
     I2=sum(I(:))/prod(size(I));
     eps=1e-4;
     temp = I2;%prod(size(I));
     temp(abs(temp)<eps) = eps;
     S1=10.*log10(PeakMax/temp);   %PSNRֵ
     S2=1-1/(1+exp(0.1701*(S1-18.6675))); %��ȨPSNR����Χ��0��1֮��
     S=str2num(sprintf('%.3f',S1)); %��������������ΪS1����S2�Ϳ���ѡ�����ΪPSNR������IPSNR��
     %S=10.*log10((255.^2)/temp);  %�Ҷ�ͼPSNRֵ������ֵΪ255
% else
%     errordlg('input is rgb image please change it to gray first','error!');
% end    
    