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

%Otto cycle
k=1.4;                           %[] Expansion coefficent
P0=1e5;                          %[Pa] Atmospheric pressure
cr=9.6;                          %[] Compression ratio

