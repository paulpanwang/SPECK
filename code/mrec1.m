%�ڲ��Ӻ�������һ��С��ϵ�������ع�

function y=mrec1(x,h,g)
%���룺x ������
%     hΪ��ͨ�˲���
%     gΪ��ͨ�˲���
%����� y ����һ��С���ع���ֵ

lenx=size(x,2);
r3=dyadup(x(1,1:lenx*0.5),0);   %�ڲ���use para 0
r4=dyadup(x(1,(lenx*0.5+1):lenx),0);   %use para 0
y=ifft(fft(r3,lenx).*fft(h,lenx))+ ifft(fft(r4,lenx).*fft(g,lenx));  