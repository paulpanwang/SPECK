%��άС���ֽ⺯��
function Y=mallatdec2(X,wname,level)

%����:X        ����Ķ�άͼ������ֵ;
%     level    С���ֽ��(��)���趨ֵ(����趨ֵ������߿ɷֽ����,����߷ֽ�����ֽ�)
%     wname    С������wavelet name
%�����Y       �༫С���ֽ���С��ϵ������

[h,g]=wfilters(wname,'d');  %h,g�ֱ�Ϊ��ͨ�͸�ͨ�˲���
X=double(X);
t=1;
hh=size(X,2);

while t<=level 
    %�Ƚ�����С���任
    for  row=1:hh
        Y(row,1:hh)=mdec1(X(row,1:hh),h,g) ;
    end
    %�ٽ�����С���任
    for col=1:hh
        temp=mdec1( Y(1:hh,col)',h,g);
        Y(1:hh,col)=temp';
    end
t=t+1;
hh=hh/2;
X=Y;

end

 