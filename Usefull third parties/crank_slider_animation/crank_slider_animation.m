%This m-script shows a simple simulation for the crank-slider mechanism for 
% the crank shaft-piston mechanism  
% l = rod length (distance between piston pin and crank pin)
% r = crank radius (distance between crank pin and crank center, i.e. half stroke)
% A = crank angle (from cylinder bore centerline at TDC)
% x = piston pin position (upward from crank center along cylinder bore centerline)
% Check http://en.wikipedia.org/wiki/Piston_motion_equations for more
% details
%Written by: Nassim Khaled-February 2010


%The crank-slider mechanism scretch

%   P
%   o
%     o
%      o
%       o N
%      *
%     *
%    *
%   O

% O [0,0] is the pivot of the crank shaft

l=30;
r=15;
X=[0 0 0];
Y=[0 r r+l];
X_Piston=[-7 7 7 -7 -7];
Y_Piston=[l-5 l-5 l+5 l+5 l-5];
h = plot(X,Y,'LineWidth',4,'XDataSource','X','YDataSource','Y');
axis([-1.1*r 1.1*r  -1.5*r 1.5*r+l]);
set(gca,'DataAspectRatio',[1 1 1]) 
grid on
hold('all')
g = plot(X_Piston,Y_Piston,'r','LineWidth',4,'XDataSource','X_Piston','YDataSource','Y_Piston');
angle=0:0.01:2*pi;
x_circle=r.*cos(angle);
y_circle=r.*sin(angle);
i = plot(x_circle,y_circle,'LineWidth',4)
for A=0:0.08:4*pi
    x=r*cos(A)+sqrt(l^2-r^2*sin(A)^2);
    N=[r*sin(A) r*cos(A)];
    P=[0 x];
    X=[0 r*sin(A) 0];
    Y=[0 r*cos(A) x];
    Y_Piston=[x-5 x-5 x+5 x+5 x-5];
    refreshdata(h,'caller') 
    refreshdata(g,'caller') 
    refreshdata(i,'caller') 
    drawnow
    pause(.1)
end
   