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
syms t

%Dimentions
lr=0.144;        %[m] Rod lenght
lh=lr/3;         %[m] Distance bw central of gravity of the rod and the crankshaft junction (big eye)
lk=0.054;        %[m] Crank radious
xs=0.13;         %[m] Slider stroke (corsa dello slider)
ds=0.082;        %[m] Slider diameter
Ad=pi*(ds/2)^2;  %[m^2] Slider surface area
lambda= lr/lh;   %[] Ratio Crank-rod

%Masses
ms=0.456;       %[kg] Slider mass
mr=0.568;       %[kg] Rod mass
mk=0.3;         %[kg] Crankshaft mass                                                %%%%%%%%%%%%%%%%%%%%%% RICONTROLLA %%%%%%%%%%%%%%%%%%%
ma=ms+mr*lh/lr; %[kg] Sum or the translating masses for one cylinder                 %%%%%%%%%%%%%%%%%%%%%  RICONTROLLA %%%%%%%%%%%%%%%%%%%

%Mechanisms Position
syms phi(t)                     %[rad] angle position of the Crankshaft
syms beta(t)                    %[rad] angle bw connection rod & ground
syms px(t) py(t) pz(t)          %[m] Crank center position
syms pkx(t) pky(t) pkz(t)       %[m] Crank-rod junction position
syms psx(t) psy(t) psz(t)       %[m] Rod-slider junction position

%Inertial forces
Jf1=0.007627;                        %[kg*m^2] Crank-Cranckshaf inertial for one cylinder
Jr=Jf1 + (mr*(lr-lh)/lr)*lk^2;       %[kg*m^2] Inertial of all rotating masses on a singular cylinder 


%% Kinematic equations

beta= acos(sqrt(1-(lambda^2)*(sin(phi).^2))); 

px=0;py=0; py=0;
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

phi_dot=diff(phi,t); 

phi=t;
%% Euelr & Langrange equations

%Kinetic energy
K_rot= (1/2)*Jr*(phi_dot)^2;        %Kinetic energy of all rotation masses
K_slider= (1/2)*ma*(xd_dot)^2;      %Kinetic energy of the slider
K_tot=K_rot+K_slider;               %Total kientic energy

U= (mk + mr*(lr-lh)/lr)*9.81*lk*sin(phi);

L= diff(diff(K_tot,phi,2),t)-diff(K_tot,phi) + diff(U,phi);


