function ProcessI_d(Rest)

global Xa
global Rest
global T
global outline
global n
global count
if Rest<=length(Xa)
    if outline(count)==1
        count=count+1;
        CodeI_d(Rest);
    else
        count=count+1;
    end
end
