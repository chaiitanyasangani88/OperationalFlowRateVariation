function [ y ] = Func( X, P )
%   Detailed explanation goes here

%X is Qsc 

K = 6.67*(10^-4);
L = 10000;			%Depth of Reservoir
Gg = 0.71;			%Gamma g/ Density of gas
D = 2.259;			%Diameter of pipe 
eD = 0.0006;		%Epsilon D
teta = 0;			%Inclination Angle
Phf = 800;			%Head pressure
Thf = 150;			%Head temperature
Twf = 200;			%Bottom Hole temperature
P = 2000;			%Reservoir Pressure
n = 0.8;			%IPR Model Parameters
C = 0.01;			%IPR Model Parameters
Tav = 460+(Thf + Twf)/2;	%Average Temperature
Pav = (Phf + P)/2;			%Average Pressure
Zavg = Zav(Tav,Pav,Gg);		
S = 0.0375*Gg*L*cos(teta/57.3)/(Zavg*Tav);
fm = (1/(1.74-2*log(2*eD)))^2;
AOF = C*(P^2)^n;
y = (P^2) -((X/C)^(1/n))-(Phf^2)*exp(S) -((K*(exp(S)-1)*fm*(X^2)*(Zavg^2)*(Tav^2)))/(D^5*cos(teta/57.3));
end

