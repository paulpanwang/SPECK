function X = mapping(n)

%���recurison limitĬ��Ϊ500�����ƣ�����stack space��������ϵͳ����
if n == 2

   X = [1 2; 3 4];

else

   B = mapping(n/2);

   X = [B B+(n/2)^2; B+(n/2)^2*2 B+(n/2)^2*3];

end

