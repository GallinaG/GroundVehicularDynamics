%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Ground Vehicular dynamics Slider-Crank Mechanism
%  Center of the crank is positioned in the origin of my inertial frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
%% PARAMETERS AND VARIABLES

syms t real %time declaration
syms phy(t) theta(t) psi(t) %unknown functions
syms x(t)   y(t)    z(t)    %unknown functions
syms s %dummy variable

tstep=1000;     %change it to imporve/relax risolution
%RPM = 3000;    % so I'll need 0.02s for complete each rampage
t=linspace(0,0.02,tstep);
phy = linspace(0,2*pi,tstep);

%% Parameters

%masses
m1=0.3;     %Crank  [kg]
m2=0.036;   %Rod    [kg]
m3= 1.25;   %Slider [kg]

%lengths
l1=0.03;     %Crank  [m]
l2=0.12;     %Rod    [m]
l3=(l1*cos(phy)+sqrt(((l1*cos(phy)).^2)-(l1^2-l2)))/(l1^2-l2);
%intertial moments
m1=0.000072;     %Crank  [kg*m2]
m2=0.0000624;    %Rod    [kg*m2]
m3= 0.00068;     %Slider [kg*m2]

%% joint variables vector
P1=[0;0;0];
P2=[l1*cos(phy);l2*sin(phy);0];
P3=[l3;0;0];
%rotation matrices
R1(s)=[ cos(s) sin(s) 0     %yaw
       -sin(s) cos(s) 0
            0    0    1];
        
R2(s)=[ cos(s) 0 -sin(s)    %pich
            0    1    0
        sin(s)  0  cos(s)];

R3(s)=[ 1   0   0           %roll
        0 cos(s) sin(s)
        0 -sin(s) cos(s)];
    

%Inetrial
