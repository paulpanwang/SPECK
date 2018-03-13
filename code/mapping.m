function X = mapping(n)

%提高recurison limit默认为500的限制，当心stack space不够导致系统崩溃
if n == 2

   X = [1 2; 3 4];

else

   B = mapping(n/2);

   X = [B B+(n/2)^2; B+(n/2)^2*2 B+(n/2)^2*3];

end

