%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%      Ground Vehicular dynamics: Slider crank Mechanism
%      Winter 2021
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clc
clear

%% Parameter & variables

%Mechanism Parameters
syms t real

%Dimentions
syms lr          %[m] Rod lenght
syms lh     %[m] Distance bw central of gravity of the rod and the crankshaft junction (big eye)
syms lk          %[m] Crank radious
syms xs          %[m] Slider stroke (corsa dello slider)
syms ds          %[m] Slider diameter
syms Ad;  %[m^2] Slider surface area
syms lambda   %[] Ratio Crank-rod

%Masses
syms ms       %[kg] Slider mass
syms mr       %[kg] Rod mass
syms mk         %[kg] Crankshaft mass                                                %%%%%%%%%%%%%%%%%%%%%% RICONTROLLA %%%%%%%%%%%%%%%%%%%
syms ma %[kg] Sum or the translating masses for one cylinder                 %%%%%%%%%%%%%%%%%%%%%  RICONTROLLA %%%%%%%%%%%%%%%%%%%

%Otto cycle
syms k                           %[] Expansion coefficent
syms P0                          %[Pa] Atmospheric pressure
syms cr                          %[] Compression ratio


%Mechanisms Position
syms phi(t)                     %[rad] angle position of the Crankshaft
syms beta(t)                    %[rad] angle bw connection rod & ground
syms px(t) py(t) pz(t)          %[m] Crank center position
syms pkx(t) pky(t) pkz(t)       %[m] Crank-rod junction position
syms psx(t) psy(t) psz(t)       %[m] Rod-slider junction position

%Inertial forces
syms Jf1                        %[kg*m^2] Crank-Cranckshaf inertial for one cylinder
Jr=Jf1 + (mr*(lr-lh)/lr)*lk^2;       %[kg*m^2] Inertial of all rotating masses on a singular cylinder 


%% Kinematic equations

beta= acos(sqrt(1-(lambda^2)*(sin(phi).^2))); 

px=0; py=0; pz=0;
p=[px; py; pz];

pkx=lk*cos(phi);
pky=lk*sin(phi);
pkz=0;
pk=[pkx; pky; pkz];

psx = lr*cos(beta)+lk*cos(phi);
psy= 0;
psz= 0;
ps=[psx; psy; psz];

xd=lk*(1+cos(phi))+lr*(-1+cos(beta));       %displacement of the piston 
xd_dot=diff(xd,t);

Pd=P0*(2*lk/(2*lk-xd))^k;         %[Pa]Gas pressure in the cyclinder where 2*lk is the minimum distance of the slider

phi_dot=diff(phi,t); 
syms Omega(t)
%% Euelr & Langrange equations

%Kinetic energy
K_rot= (1/2)*Jr*(phi_dot)^2;        %Kinetic energy of all rotation masses
K_slider= (1/2)*ma*(xd_dot)^2;      %Kinetic energy of the slider
K_tot=K_rot+K_slider;               %Total kientic energy

K_tot = subs(K_tot, phi_dot,Omega); 
U= (mk + mr*(lr-lh)/lr)*9.81*lk*sin(phi);
alpha=diff(K_tot,Omega);
L= diff(alpha,t)-diff(K_tot,phi) + diff(U,phi);
Fd=P0*Ad*(((2*lk/(2*lk-xd))^k)-1);                                           %[N]Formula of the gasforce
Fdt=Fd*sin(phi)*((1+lambda*cos(phi))/(sqrt(1-(lambda^2)*(sin(phi)^2))));     %[N]Tangential component of the Fd

