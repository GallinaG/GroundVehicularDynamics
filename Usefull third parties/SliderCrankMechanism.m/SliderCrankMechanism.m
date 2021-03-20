% Ryerson University
% Adit Mistry

close all
clear all
clc

%% SET UP

r2 = 140;
r3 = 210;

% Set up for animation
figure
axis (gca, 'equal');
axis ([-400 600 -400 400])

zz(3,:) = [0, 0];

% Angles
th2 = deg2rad (0:20:720);

% Angluar speed
om2 = 1;

%% LOOP

% i is the time to run the animation for
for i = 1:500
    
    
    th1 = om2*(i/10);
    aph = asin((r2*sin(th1))/(r3));
    
    % Distance between Slider and stationary point 
    r1 = ((r2*cos(th1)) + (r3*cos(aph)));
    
    % Positions of links and joints
    zz(1,:) = [r1, 0];
    zz(2,:) = [r2*cos(th1), r2*sin(th1)];
    
    % Plot the results
    plot (zz(:,1), zz(:,2), 'o-')
    title ('Slider Crank Mechanism')
    axis ([-400 600 -400 400])
    pause (0.01)

end
