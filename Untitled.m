clear all;
clc;close all;

sfile = cell(1,18);    %ͼ���زĿ�����������ʼ��������Ϊϸ�����飬ϸ������ɴ洢��ͬ��ʽ�����ȵ�Ԫ�ء�
                       %���һάcell��������ͼ������cell�ĳ���Ҫ��ͼ��������С��
sfile = {'img1','img2','img3','img4','img5','img6','img7','img8', 'img9','img10','img11','img12','img13','img14','img15','img16',  'img17','img18'};     
                       %�˴�����ͼ�������ö��Ÿ���������������ͼ������ͼ��Ҫ��һ��·���¡�
ssfile = sfile(1:18);     %����������ѡȡͼ�񣬴�sfile������ѡȡ����ͼ��
for j=1:length(ssfile)
    
s_filename = strcat('C:\Users\zou\Desktop\speck\512��512\',ssfile{j},'.bmp');%����ͼ��·������ȡͼ������
X0 = double(imread(s_filename,'BMP'));
IAM0(j)=LoadIAM2(X0);
end