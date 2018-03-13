function meanImg=LoadIAM2(dataImg)
dataImg=double(dataImg);
ksize=size(dataImg);
yh=ksize(1);
xw=ksize(2);
XsumImg=0;
YsumImg=0;
for w=1:(xw-1)
    dataXimg=abs(dataImg(:,w)-dataImg(:,(w+1)));
    XsumImg=XsumImg+sum(dataXimg);
end
for h=1:(yh-1)
    dataYimg=abs(dataImg(h,:)-dataImg((h+1),:));
    YsumImg=YsumImg+sum(dataYimg);
end
    meanImg=(XsumImg+YsumImg)/(xw*yh);