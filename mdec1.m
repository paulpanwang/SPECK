%内部子函数，对一行(row)矢量进行一次小波变换，利用fft实现
function y=mdec1(x,h,g)
%输入：x 行数组
%     h为低通滤波器
%     g为高通滤波器
%输出： y 进行一级小波分解后的系数

lenx=size(x,2);
lenh=size(h,2);

rh=h(end:-1:1);
rrh=[zeros(1,(lenx-lenh)),rh];
rrh=circshift(rrh',1)';

rg=g(end:-1:1);
rrg=[zeros(1,(lenx-lenh)),rg];
rrg=circshift(rrg',1)';

r1=dyaddown(ifft(fft(x).*fft(rrh,lenx)),1);  %use para 1
r2=dyaddown(ifft(fft(x).*fft(rrg,lenx)),1);
y=[r1,r2];