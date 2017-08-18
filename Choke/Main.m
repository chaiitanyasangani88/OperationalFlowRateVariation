%For a given reservoir pressure(psi)
P=2000;
D = 2.259:0.1:3.95;	%Varying the Diameter of pipe
n = length(D);
Dck = 8 :2:40;		%Varying the Diameter of Choke
N = length(Dck);
for i = 1:n
    for j = 1:N
     Fun = @(X)Func(X,D(i),Dck(j));
     y(i,j) = fzero(Fun,P/2);   
    end
end 

%Grid Creation
[Dmap,Dckmap] = meshgrid(2.259:0.1:3.95,8 :2:40);

surf(Dmap,Dckmap,y);
title('Variation of Operating flow rate with diameter of choke and pipe')
xlabel('Diameter of Pipe(inch) ');
ylabel('Diameter od choke(1/64 inch ) ');
zlabel('Operating flow rate(Mscf/d)')