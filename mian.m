% speck编码；小波变换采用mallat小波变换
%level为小波变换层数；
%sm为speck编码时的扫描次数；

clear all;
clc;
close all;

%--------------读取图像-----------%
sfile = cell(1,18);    %图像素材库名称索引初始化，定义为细胞数组，细胞数组可存储不同格式、长度的元素。
                       %这个一维cell用来储存图像名，cell的长度要比图像数量大小大。
% sfile = {'img1','img2','img3','img4','img5','img6','img7','img8','img9','img10','img11','img12','img13','img14','img15','img16','img17','img18'};     %此处输入图像名，用逗号隔开，便于批处理图像。所有图像要在一个路径下。
% sfile = {'1800_1','1800_2','1800_3','1800_4','1800_5','1800_6','1800_7','1800_8','1800_9','1800_10','1800_11','1800_12','1800_13','1800_14','1800_15'};  
% sfile = {'3000_1','3000_2','3000_3','3000_4','3000_5','3000_6','3000_7','3000_8','3000_9','3000_10','3000_11','3000_12','3000_13','3000_14','3000_15'};  
% sfile = {'BFS_1','BFS_2','BFS_3','BFS_4','BFS_5','BFS_6','BFS_7','BFS_8','BFS_9','BFS_10','BFS_11','BFS_12','BFS_13','BFS_14','BFS_15'};  
% sfile = {'D1800_1','D1800_2','D1800_3','D1800_4','D1800_5','D1800_6','D1800_7','D1800_8','D1800_9','D1800_10','D1800_11','D1800_12','D1800_13','D1800_14','D1800_15'};  
% sfile = {'DDH_1','DDH_2','DDH_3','DDH_4','DDH_5','DDH_6','DDH_7','DDH_8','DDH_9','DDH_10','DDH_11','DDH_12','DDH_13','DDH_14','DDH_15'};
 sfile = {'sidescan_1','sidescan_2','sidescan_3','sidescan_4','sidescan_5','sidescan_6','sidescan_7','sidescan_8','sidescan_9','sidescan_10','sidescan_11','sidescan_12','sidescan_13','sidescan_14','sidescan_15'};
ssfile = sfile(1);     %该数组用来选取图像，从sfile索引里选取若干图像
% sm=7
% level=3
sm=4:9
level=3:6

%----------为图像质量评价的3种性能参数申请存储空间，存放传输图像的质量评价参数统计------%
PSNR = zeros(length(ssfile)*length(level),length(sm));
IPSNR = zeros(length(ssfile)*length(level),length(sm));
SSIM = zeros(length(ssfile)*length(level),length(sm));
RATIO=zeros(length(ssfile)*length(level),length(sm));

for j=1:length(ssfile)
    for i=1:length(level)
        for k=1:length(sm)
            s_filename = strcat('C:\Users\zou\Desktop\speck\sonar\sidescan\',ssfile{j},'.bmp');%设置图像路径，获取图像原始数据，用于计算最后输出图像的PSNR
            X0 = double(imread(s_filename,'BMP'));
           [row, col] = size(X0);
        
           lev=i+2;
           lev_sm=k+6;
%            X1=mallatdec2(X0,'sym2',lev);  %小波分解
            X1=dec_haar(X0,lev);  %haar小波变换

           
           [T,Sorting]=Weight(X1);%计算权值,扫描的次数
           threshold=T;%保存初始化权值

%            ---speck编码----------------%
          [lineout,T0,Arow,ratio]=speckencode(X1,lev,lev_sm); %speck编码
%           dlmwrite([ssfile{j},'level',num2str(i+2),'sm',num2str(k+3),'.txt'],lineout);      %输出码流保存成txt格式

              %码流保存成bin文件
            fid=fopen([ssfile{j},'level',num2str(lev),'sm',num2str(lev_sm),'.bin'],'wb');
            fwrite(fid,lineout,'double');
            fclose(fid);
            

%----------读取bin文件-------%
%            filename=strcat('C:\Users\zou\Desktop\speck\',ssfile{j},'level3sm4.bin');
%            fid=fopen(filename,'rb');
%            [importdata,count]=fread(fid,'double');
%            fclose(fid);
            
          ratio_degree=ratio/(row*col*8);  %压缩比
                
          %-----------------speck解码----------------------%
          X2=speckdecode(lineout,X1,T0,Arow,lev,lev_sm);%speck解码
         
          
%            X3=mallatrec2(X2,'sym2',lev);%小波合成
          X3=idec_haar(X2,lev); %haar小波重构
          X4=uint8(X3);
          
         psnr_degree=psnr(X0,X3); %计算PSNR值
         ipsnr_degree=1-1/(1+exp(0.1701*(psnr_degree-18.6675)));
         ssim_degree= ssim(X0,X3);
    
         PSNR(j*i,k)=psnr_degree;
         IPSNR(j*i,k)=ipsnr_degree;
         SSIM(j*i,k)=ssim_degree;
        RATIO(j*i,k)=ratio_degree;


         
         %输出压缩图像
         filename = strcat(ssfile{j},'level-',num2str(lev),'sm-',num2str(lev_sm),'.bmp');
         imwrite(X4,filename,'BMP') ;
         
        
        end
    end
end
disp('————————————————————————处理完成！————————————————————————————————');
PSNR;
IPSNR;
SSIM;






