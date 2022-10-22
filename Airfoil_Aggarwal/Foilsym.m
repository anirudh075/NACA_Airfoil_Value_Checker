function[Xvalues, Yupper, Ylower] = Foilsym(percentage_thickness)
%[Xvalues, Yupper, Ylower] = Foilsym(percentage_thickness)
%  Returns the data points for the shape of a 4 digit symetrial NACA airfoil    
%Where percentage_thickness = maximum thickness (last 2 numbers) of the airfoil in percentage of chord
%
%
% created by Anirudh Aggarwal 

Xvalues = linspace(0,1,200);
Yupper = ((percentage_thickness)/0.2).*(sqrt(Xvalues).*0.2969 - (0.126.*Xvalues) - (0.3516.*(Xvalues.^2)) + (0.2843.*(Xvalues.^3)) - (0.1015.*(Xvalues.^4)));
Ylower = -1.*Yupper;
end