 function CodeS_d(S)
 
global Xa
global T
global LSP
global LISi;global LISj;global LISk;
global outline
global each
global n
global count
%Partition S into four equal subsets Sn
%if S(1)==33
%    display(S(1));
%end
%shape(S);  %��S��Xa������������
for i=1:4
    Sn(1)=S(1)+(i-1)*S(2)/4;
    Sn(2)=S(2)/4;
    if  outline(count)==1
        count=count+1;
        if Sn(2)==1 %S�ǵ�����       
            LSP=[LSP,Sn(1)];
            if outline(count)==1    % '1'=='+'
                Xa(Sn(1))=1.5*T;                     
            else
                Xa(Sn(1))=-1.5*T;
            end
            count=count+1;
        else
            CodeS_d(Sn);
        end
    elseif outline(count)==0
        count=count+1;        
        LISi=[LISi,Sn(1)];  %����Sn��LIS
        LISj=[LISj,Sn(2)];
        %each=each+1;
    end
end
%shape_d(S); %��S��Xa���з�����