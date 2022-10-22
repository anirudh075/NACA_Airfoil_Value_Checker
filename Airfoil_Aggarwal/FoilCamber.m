function [Xupper, Xlower, Yupper, Ylower]=FoilCamber(m, p, t)
%USE AS: [Xupper, Xlower, Yupper, Ylower]=FoilCamber(m, p, t)
%   Returns the data points for the shape of a 4 digit cambered NACA airfoil    
%Where m = maximum camber (1st digit) in percentage of chord
%      p = position of the maximum camber (2nd digit) in tenths of chord
%      t = maximum thickness (last 2 numbers) of the airfoil in percentage of chord
%
%Example: NACA 2412
%   [Xupper, Xlower, Yupper, Ylower]=FoilCamber(.02, .40, .12)


%forward of max camber position
x_forward = linspace(0,p); %X spacing
Yc_forward = (m./(p.^2)).*((2.*p.*x_forward)-(x_forward.^2)); %camber line
theta_forward = atan((m*(2*p - 2*x_forward))/p^2);%Derivativre of camberline
Yt = (t./0.2).*((0.2969.*sqrt(x_forward)-(0.126.*x_forward)-0.3516*x_forward.^2)+(0.2843.*x_forward.^3)-(0.1015.*x_forward.^4));

Xupper_forward = x_forward - Yt.*sin(theta_forward); %X data on upper surface 
Yupper_forward = Yc_forward + Yt.*cos(theta_forward); %Y data on upper surface

Xlower_forward = x_forward + Yt.*sin(theta_forward); %X data on lower surface
Ylower_forward = Yc_forward - Yt.*cos(theta_forward); %Y data on lower surface

%aft %of max camber position
x_aft = linspace(p,1); %X spacing
Yc_aft = (m./((1-p).^2)).*((1-2.*p)+2.*p.*x_aft-x_aft.^2); %Camber line
theta_aft = atan((m*(2*p - 2*x_aft))/(p - 1)^2); %Derivative of camber line
Yt = (t./0.2).*(0.2969.*sqrt(x_aft)-0.126.*x_aft-0.3516*x_aft.^2+0.2843.*x_aft.^3-0.1015.*x_aft.^4);

Xupper_aft = x_aft - Yt.*sin(theta_aft); %X data on upper surface 
Yupper_aft = (Yc_aft + Yt.*cos(theta_aft)); %Y data on upper surface 


Xlower_aft = x_aft + Yt.*sin(theta_aft); %X data on lower surface
Ylower_aft = (Yc_aft - Yt.*cos(theta_aft)); %Y data on lower surface

%Concatenate forward and aft data sets
Yupper = [Yupper_forward Yupper_aft];
Ylower = [Ylower_forward Ylower_aft];
Xupper = [Xupper_forward Xupper_aft];
Xlower = [Xlower_forward Xlower_aft];