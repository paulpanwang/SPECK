function [lineout,threshold,Arow,ratio]=speckencode(X0,level,sm)


%speck encode,X0为输入矩阵，sm为扫描顺序
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
global LISi;global LISj;  %LISi记录LIS集合元素的位置，LISj记录LIS集合的长度
global LSP                %LSP集合元素的位置
global Xa                 %按Z字形拉成一个一维矩阵  
global Rest               %剩余序列的起始位置  
global outline            %输出码串  
global T                  %门限  
global each               %LIS集合指针  
global n                  %扫描次数控制  
global LISisz             %每次扫描的LIS集合的长度 
%initialization
[T,Sorting]=Weight(X0);%计算权值,扫描的次数
threshold=T;%保存初始化权值
outline=[]; %
lineout=[];
%--partition image transform X into two sets:S=root,and I=X-S;
Xa=spitX1(X0); %把X0拆分成一行,排列顺序A Hn Vn Dn Hn-1 Vn-1 Dn-1 ....
[Arow,Acol]=size(X0);
k=Arow/2^level;
Asize=k*k;
%Asize=4;%A块的长度
Rooti=[1];Rootj=[Asize];  %Rooti存放Xa里块的起始位置,Asize存放长度
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
    display('扫描次数过大,将按最大扫描次数扫描');    
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
    LISi=LISi(index);  %对LISi用LISj进行重排序，
    %display(n);
    T=T/2;n=n+1;
   % if n==3
   %    each;
   %end
    %display(outline);    
    bitstotal=bitstotal+length(outline); %所用bits数统计
    %lineout(outputcount)={outline};      %输出串合成元包数组
    lineout=[lineout outline];
    outputcount=outputcount+1;
    outline=[];
end
%ratio=Arow*Acol*8/bitstotal;
ratio=bitstotal;
%display(ratio);

