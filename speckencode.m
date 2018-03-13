function [lineout,threshold,Arow,ratio]=speckencode(X0,level,sm)


%speck encode,X0Ϊ�������smΪɨ��˳��
% X1=[63 -34 49 10 7 13 -12 7 ;
%    -31 23 14 -13 3 4 6 -1 ;
%   15 14 3 -12 5 -7 3 9 ;
%   -9 -7 -14 8 4 -2 3 2 ;
%   -5 9 -1 47 4 6 -2 2 ;
%   3 0 -3 2 3 -2 0 4;
%   2 -3 6 -4 3 6 3 6 ;
%   5 11 5 6 0 3 -4 4 ];
% X0=double(X1);
% level=2;
% sm=1;
% [row, col] = size(X0);
% [T,sorting]=Weight(X0);
% threshold=T;
global LISi;global LISj;  %LISi��¼LIS����Ԫ�ص�λ�ã�LISj��¼LIS���ϵĳ���
global LSP                %LSP����Ԫ�ص�λ��
global Xa                 %��Z��������һ��һά����  
global Rest               %ʣ�����е���ʼλ��  
global outline            %����봮  
global T                  %����  
global each               %LIS����ָ��  
global n                  %ɨ���������  
global LISisz             %ÿ��ɨ���LIS���ϵĳ��� 
%initialization
[T,Sorting]=Weight(X0);%����Ȩֵ,ɨ��Ĵ���
threshold=T;%�����ʼ��Ȩֵ
outline=[]; %
lineout=[];
%--partition image transform X into two sets:S=root,and I=X-S;
Xa=spitX1(X0); %��X0��ֳ�һ��,����˳��A Hn Vn Dn Hn-1 Vn-1 Dn-1 ....
[Arow,Acol]=size(X0);
k=Arow/2^level;
Asize=k*k;
%Asize=4;%A��ĳ���
Rooti=[1];Rootj=[Asize];  %Rooti���Xa������ʼλ��,Asize��ų���
Rest=Asize+1;
%add S to LIS and set LSP={}
LISi=Rooti;LISj=Rootj;
LSP=[];
%Sorting Pass
n=1;
bitstotal=0;
outputcount=1;
display(Sorting);
if sm>Sorting
    display('ɨ���������,�������ɨ�����ɨ��');    
end
while n<=Sorting & n<=sm & T>=2
    each=1;
    LSPflag=length(LSP);
    LISisz=length(LISi);
    while each<=LISisz
        S=[LISi(each),LISj(each)];
        ProcessS(S);
        each=each+1;       
    end
    ProcessI(Rest);
    %Refinement Pass
    Refinement(LSP,LSPflag);
    [LISj,index]=sort(LISj);
    LISi=LISi(index);  %��LISi��LISj����������
    %display(n);
    T=T/2;n=n+1;
   % if n==3
   %    each;
   %end
    %display(outline);    
    bitstotal=bitstotal+length(outline); %����bits��ͳ��
    %lineout(outputcount)={outline};      %������ϳ�Ԫ������
    lineout=[lineout outline];
    outputcount=outputcount+1;
    outline=[];
end
%ratio=Arow*Acol*8/bitstotal;
ratio=bitstotal;
%display(ratio);

