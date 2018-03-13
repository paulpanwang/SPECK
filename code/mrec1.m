%内部子函数，对一行小波系数进行重构

function y=mrec1(x,h,g)
%输入：x 行数组
%     h为低通滤波器
%     g为高通滤波器
%输出： y 进行一级小波重构后值

lenx=size(x,2);
r3=dyadup(x(1,1:lenx*0.5),0);   %内插零use para 0
r4=dyadup(x(1,(lenx*0.5+1):lenx),0);   %use para 0
y=ifft(fft(r3,lenx).*fft(h,lenx))+ ifft(fft(r4,lenx).*fft(g,lenx));  