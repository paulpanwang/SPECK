%��άС���ع�����
function Y=mallatrec2(X,wname,level)
%����:X      �����С��ϵ������;
%     level  С���ֽ��(��)���趨ֵ(����趨ֵ������߿ɷֽ����,����߷ֽ�����ֽ�)
%      wname  С������wavelet name
%�����Y     �ع�ͼ�����

[h,g]=wfilters(wname,'d');  %h,g�ֱ�Ϊ�ع���ͨ�˲������ع���ͨ�˲���
hz=size(X,2);
h1=hz/(2^(level-1));

while h1<=hz
    % ���б任
    for col=1:h1
        temp=mrec1(X(1:h1,col)',h,g)';
        X(1:h1,col)=temp;
    end
    %�ٶ��б任
    for row=1:h1
        temp=mrec1(X(row,1:h1),h,g);
         X(row,1:h1)=temp;
    end
     h1=h1*2;
end
Y=X;