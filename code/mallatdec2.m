%二维小波分解函数
function Y=mallatdec2(X,wname,level)

%输入:X        载入的二维图像像数值;
%     level    小波分解次(级)数设定值(如果设定值超过最高可分解次数,按最高分解次数分解)
%     wname    小波名字wavelet name
%输出：Y       多极小波分解后的小波系数矩阵

[h,g]=wfilters(wname,'d');  %h,g分别为低通和高通滤波器
X=double(X);
t=1;
hh=size(X,2);

while t<=level 
    %先进行行小波变换
    for  row=1:hh
        Y(row,1:hh)=mdec1(X(row,1:hh),h,g) ;
    end
    %再进行列小波变换
    for col=1:hh
        temp=mdec1( Y(1:hh,col)',h,g);
        Y(1:hh,col)=temp';
    end
t=t+1;
hh=hh/2;
X=Y;

end

 