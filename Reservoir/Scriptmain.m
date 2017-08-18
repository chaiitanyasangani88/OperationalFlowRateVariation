function [ y ] = Scriptmain( Pin,L )
%Detailed explanation goes here
Ni = length(Pin);
%Parameters for calculation
K = 6.67*(10^-4);
y = zeros(Ni,1);
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
fm = (1/(1.74-2*log(2*eD)))^2; 	%Nikuradse friction factor for turbulent flows

%The Average Temperature and Compressibility Factor Method IPR
for i = 1:1:Ni
    P = Pin(i);
	Pav = (Phf + P)/2;
	Zavg = Zav(Tav,Pav,Gg);
	S = 0.0375*Gg*L*cos(teta/57.3)/(Zavg*Tav); 
	Fun = @(X)Func(X,P);
	y(i,1) = fzero(Fun,Pav);
end

