%二维小波重构函数
function Y=mallatrec2(X,wname,level)
%输入:X      载入的小波系数矩阵;
%     level  小波分解次(级)数设定值(如果设定值超过最高可分解次数,按最高分解次数分解)
%      wname  小波名字wavelet name
%输出：Y     重构图像矩阵

[h,g]=wfilters(wname,'d');  %h,g分别为重构低通滤波器和重构高通滤波器
hz=size(X,2);
h1=hz/(2^(level-1));

while h1<=hz
    % 对列变换
    for col=1:h1
        temp=mrec1(X(1:h1,col)',h,g)';
        X(1:h1,col)=temp;
    end
    %再对行变换
    for row=1:h1
        temp=mrec1(X(row,1:h1),h,g);
         X(row,1:h1)=temp;
    end
     h1=h1*2;
end
Y=X;