%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  Ground Vehicular dynamics Slider-Crank Mechanism
%  Center of the crank is positioned in the origin of my inertial frame
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc
clear all
close all
%% PARAMETERS AND VARIABLES

syms t real %time declaration
syms phi(t) theta(t) psi(t) %unknown functions
syms x(t)   y(t)    z(t)    %unknown functions
syms s %dummy variable

tstep=100;     %change it to imporve/relax risolution
RPM = 3000;    % so I'll need 0.02s for complete each rampage
d_dphi=RPM/60;   %[Hz] since I'm going at 3000rpm. I impose constant the angular speed of my crank

tsim=linspace(0,0.02,tstep);
phi = linspace(0,2*pi,tstep);

%% Parameters

%masses
m1=0.3;     %Crank  [kg]
m2=0.036;   %Rod    [kg]
m3= 1.25;   %Slider [kg]

%lengths
l1=0.03;     %Crank  [m]
l2=0.12;     %Rod    [m]
l3=(l1*cos(phi)+sqrt(((l1*cos(phi)).^2)-(l1^2-l2)))/(l1^2-l2);

%intertial moments
Im1=0.000072;     %Crank  [kg*m2]
Im2=0.0000624;    %Rod    [kg*m2]
Im3= 0.00068;     %Slider [kg*m2]

%Inertial
J1=(1/3)*m1*l1^2;
J2=(1/3)*m2*l2^2;
%% joint variables vector
P1=[zeros(1,tstep);zeros(1,tstep);zeros(1,tstep)];
P2=[l1*cos(phi);l2*sin(phi);zeros(1,tstep)];
P3=[l3;zeros(1,tstep);zeros(1,tstep)];

%% PLOT TEST
for i = 1: tstep
    hold on
    plot(l1*cos(phi(i)),l2*sin(phi(i)))
end

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
    

%% Kinetic energy
K1=(1/2)*J1*d_dpsy(t);
