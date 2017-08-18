function [ Zav ] = Zav(Tav,Pav,Gg)
%The calculation for Average Compressibility Factor
%   Detailed explanation goes here
%Critical Pressure Calculation
Ppc = 677+15*Gg - 37.5*Gg^2;
Tpc = 168 + 325*Gg - 12.5*Gg^2;
%Reduced Pressure
Ppr = Pav/Ppc;
Tpr = Tav/Tpc;
%Brill and Beggs z-factor correlation
A = 1.39*((Tpr-0.92)^0.5) - 0.36*Tpr -0.101;
B = (0.62-0.23*Tpr)*Ppr + ((0.066/(Tpr-0.86))-0.037)*Ppr^2 + (0.32*Ppr^6)/((10^(9*(Tpr-1))));
C = 0.132-0.32*log10(Tpr);
D = 10^(0.3106-0.49*Tpr+0.1824*Tpr^2);

Zav = A + ((1-A)/exp(B))+C*(Ppr^D);

end

