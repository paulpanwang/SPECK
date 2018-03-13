function ProcessS_d(S)
%解码
global Xa
global T
global LSP
global LISi;global LISj;global LISk;
global outline
global each
global n
global count
global LISisz
if outline(count)==1
    count=count+1;
    %if S is a coefficient,output sign of S and add S to LSP
    if S(2)==1 %S是单点数       
        LSP=[LSP,S(1)];
        if  outline(count)==1     % '1'=='+'
            Xa(S(1))=1.5*T;                        
        else
            Xa(S(1))=-1.5*T;
        end
        count=count+1;
    else  %S是集合
        CodeS_d(S);
    end
    %
    j=find(LISi==S(1));
    k=find(LISj(j)==S(2));
    if LISj(j(k))==S(2) %判断是否S在LIS内
        LISi=[LISi(1:j(k)-1),LISi(j(k)+1:end)]; %移走S
        LISj=[LISj(1:j(k)-1),LISj(j(k)+1:end)];
        each=each-1;
        LISisz=LISisz-1;
        %LISk=[LISk(1:j-1),LISk(j+1:end)];
    end 
elseif outline(count)==0
       count=count+1;
       j=find(LISi==S(1));
       k=find(LISj(j)==S(2));
    if LISj(j(k))==S(2) %判断是否S在LIS内
        return;
    else
        LISi=[LISi,S(1)]; %添加S到LIS
        LISj=[LISj,S(2)];
        %each=each+1;
        %LISk=[LISk,squa(S(2))];
    end
end