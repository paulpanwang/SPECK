clear all;
clc;close all;

sfile = cell(1,18);    %图像素材库名称索引初始化，定义为细胞数组，细胞数组可存储不同格式、长度的元素。
                       %这个一维cell用来储存图像名，cell的长度要比图像数量大小大。
sfile = {'img1','img2','img3','img4','img5','img6','img7','img8', 'img9','img10','img11','img12','img13','img14','img15','img16',  'img17','img18'};     
                       %此处输入图像名，用逗号隔开，便于批处理图像。所有图像要在一个路径下。
ssfile = sfile(1:18);     %该数组用来选取图像，从sfile索引里选取若干图像
for j=1:length(ssfile)
    
s_filename = strcat('C:\Users\zou\Desktop\speck\512×512\',ssfile{j},'.bmp');%设置图像路径，获取图像数据
X0 = double(imread(s_filename,'BMP'));
IAM0(j)=LoadIAM2(X0);
end