function [ y ] = Func( X,D,Dck )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
J = 6.67*(10^-4);
Gg = 0.75;
eD = 0.0006;
L = 8000;
teta = 0;
Dfl = 2;
k = 1.3;
mu = 0.01;
Thf = 120;
Twf = 180;
P = 2000;
C = 0.01;
n = 0.8;
fm = (1/(1.74-2*log(2*eD)))^2;
AOF = C*(P^2)^n;
Drat = Dck/(64*Dfl);
Re = 10^6;                                              %Assuming high number
Cck = Drat + 0.3167/(Drat^0.6) +0.025*(log10(Re)-4);    %Since C at high reynolds number is not sensitive to Re.
Ack = (pi/4)*(Dck/64)^2;
Kk = (2/(k+1))^((k+1)/(k-1));
Phf = (X/(879*Cck*Ack*((k*Kk/(Gg*(Thf+460)))^0.5)));    %Updating Phf
Tav = 460+(Thf + Twf)/2;
Pav = (P+Phf)/2;
Zavg = Zav(Tav,Pav,Gg)
S = 0.0375*Gg*L*cos(teta/57.3)/(Zavg*Tav);
y = X-(C*((P^2) -(Phf)^2)*exp(S) -((J*(exp(S)-1)*fm*(X^2)*(Zavg^2)*(Tav^2)))/(D^5*cos(teta/57.3)))^n 

end

