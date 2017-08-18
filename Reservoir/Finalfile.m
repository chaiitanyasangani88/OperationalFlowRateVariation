%The pressure varies from 1100 PSI to 3400 PSI
Pin=1100:100:3400;
%The Depth varies from 5000ft to 10000ft
L= 5000:100:10000;
n = length(Pin);
nl = length(L);
Y = zeros(n,nl);
for i = 1:n
    for j = 1:nl
        Y(i,j) = Scriptmain(Pin(i),L(j))
        
    end
end

[Pmap,Lmap] = meshgrid(1100:100:3400,5000:100:10000);
surf(Pmap,Lmap,Y')
title('Variation of Operating flow rate with Reservoir Pressure and Depth')
xlabel('Pressure(Psia)');
ylabel('Depth (Ft)');
zlabel('Operating flow rate(Mscf/d)')
 